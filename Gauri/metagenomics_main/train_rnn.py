# train_rnn.py
import torch
import torch.nn as nn
import random
from error_rnn import ErrorCorrectorRNN, one_hot_encode, base2idx

# Hyperparameters
window_size = 11
num_epochs = 10
batch_size = 128
learning_rate = 0.001

# Simulated data
def generate_clean_read(length=100):
    return ''.join(random.choices('ACGT', k=length))

def introduce_errors(read, error_rate=0.05):
    bases = 'ACGT'
    noisy = list(read)
    for i in range(len(read)):
        if random.random() < error_rate:
            noisy[i] = random.choice([b for b in bases if b != read[i]])
    return ''.join(noisy)

def generate_dataset(num_reads=10000, read_length=100, error_rate=0.05):
    clean_reads, noisy_reads = [], []
    for _ in range(num_reads):
        clean = generate_clean_read(read_length)
        noisy = introduce_errors(clean, error_rate)
        clean_reads.append(clean)
        noisy_reads.append(noisy)
    return clean_reads, noisy_reads

def prepare_training_data(clean_reads, noisy_reads):
    X, y = [], []
    half = window_size // 2
    for clean, noisy in zip(clean_reads, noisy_reads):
        for i in range(half, len(clean) - half):
            noisy_window = noisy[i - half:i + half + 1]
            X.append(one_hot_encode(noisy_window, window_size))
            y.append(base2idx[clean[i]])
    return torch.stack(X), torch.tensor(y)

# Model
device = 'cuda' if torch.cuda.is_available() else 'cpu'
model = ErrorCorrectorRNN().to(device)
optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)
criterion = nn.CrossEntropyLoss()

# Dataset
clean_reads, noisy_reads = generate_dataset()
X, y = prepare_training_data(clean_reads, noisy_reads)
dataset = torch.utils.data.TensorDataset(X, y)
loader = torch.utils.data.DataLoader(dataset, batch_size=batch_size, shuffle=True)

# Training loop
model.train()
for epoch in range(num_epochs):
    total_loss = 0
    for xb, yb in loader:
        xb, yb = xb.to(device), yb.to(device)
        optimizer.zero_grad()
        out = model(xb)
        loss = criterion(out, yb)
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
    print(f"Epoch {epoch+1}/{num_epochs}, Loss: {total_loss:.4f}")

# Save model
torch.save(model.state_dict(), "rnn_model.pt")
print("Model saved to rnn_model.pt")
