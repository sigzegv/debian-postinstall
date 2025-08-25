# use refind instead of grub
sudo apt install -y refind
sudo mkrlconf
sudo mkdir /boot/efi/EFI/refind/themes
sudo git clone https://github.com/sihann/refind-gruvbox-theme /boot/efi/EFI/refind/themes/refind-gruvbox-theme
echo "include themes/refind-gruvbox-theme/theme.conf" | sudo tee -a /boot/efi/EFI/refind/refind.conf
sudo sed -i -e 's/timeout 20/timeout 5/g' /boot/efi/EFI/refind/refind.conf
sudo sed -i -e '0,/quiet/s//quiet splash/' /boot/refind_linux.conf
sudo rm -rf /boot/efi/EFI/debian
