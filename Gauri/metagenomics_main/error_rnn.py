# error_rnn.py
import torch
import torch.nn as nn

class ErrorCorrectorRNN(nn.Module):
    def __init__(self, input_dim=5, hidden_dim=64, output_dim=5):
        super(ErrorCorrectorRNN, self).__init__()
        self.rnn = nn.GRU(input_dim, hidden_dim, batch_first=True, bidirectional=True)
        self.fc = nn.Linear(hidden_dim * 2, output_dim)

    def forward(self, x):
        rnn_out, _ = self.rnn(x)
        center = rnn_out[:, rnn_out.size(1)//2, :]
        return self.fc(center)

base2idx = {'A': 0, 'C': 1, 'G': 2, 'T': 3, 'N': 4}
idx2base = {v: k for k, v in base2idx.items()}

def one_hot_encode(seq, maxlen):
    vec = torch.zeros((maxlen, len(base2idx)))
    for i, base in enumerate(seq):
        if i < maxlen:
            vec[i, base2idx.get(base, 4)] = 1
    return vec

def correct_read_rnn(model, read, window_size=11, device='cpu'):
    corrected = list(read)
    half = window_size // 2

    with torch.no_grad():
        for i in range(half, len(read) - half):
            window = read[i-half:i+half+1]
            x = one_hot_encode(window, window_size).unsqueeze(0).to(device)
            logits = model(x)
            pred = torch.argmax(logits, dim=1).item()
            corrected[i] = idx2base[pred]

    return ''.join(corrected)

def batch_correct_reads_rnn(model, reads, window_size=11, device='cpu'):
    half = window_size // 2
    corrected_reads = []

    model.eval()
    with torch.no_grad():
        for read in reads:
            if len(read) < window_size:
                corrected_reads.append(read)
                continue

            windows = [
                one_hot_encode(read[i-half:i+half+1], window_size)
                for i in range(half, len(read)-half)
            ]
            X = torch.stack(windows).to(device)
            logits = model(X)
            preds = torch.argmax(logits, dim=1).tolist()

            corrected = list(read)
            for i, pred in enumerate(preds):
                corrected[i + half] = idx2base[pred]
            corrected_reads.append("".join(corrected))

    return corrected_reads
