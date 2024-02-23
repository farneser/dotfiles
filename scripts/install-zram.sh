sudo modprobe zram
sudo zramctl /dev/zram0 --algorithm zstd --size 32G
sudo mkswap -U clear /dev/zram0
yay -S zramswap --noconfirm
sudo systemctl enable --now zramswap
