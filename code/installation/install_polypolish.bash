

conda create -n polypolish
conda activate polypolish
conda install rust


cd tools/polishing/ || exit

git clone https://github.com/rrwick/Polypolish.git

cd Polypolish
cargo build --release