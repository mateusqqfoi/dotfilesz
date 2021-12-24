clear
cd ~
mkdir .temp000
cd .temp000
rm -rf ~/.config/nvim
git clone https://github.com/mateusqqfoi/dotfiles
mv dotfiles/nvim ~/.config/nvim
cd ~
rm -rf .temp000
echo "DONE"
