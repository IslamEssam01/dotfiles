mkdir ~/.config/dotfiles
cp ~/.config/copyDotfiles.sh ~/.config/dotfiles/
cp -r ~/.config/nvim/ ~/.config/dotfiles/
mkdir ~/.config/dotfiles/fish | cp -r ~/.config/fish/functions/ ~/.config/fish/config.fish ~/.config/dotfiles/fish
mkdir ~/.config/dotfiles/nnn | cp -r ~/.config/nnn/plugins ~/.config/dotfiles/nnn
mkdir ~/.config/dotfiles/tmux | cp ~/.config/tmux/tmux.conf ~/.config/dotfiles/tmux
mkdir ~/.config/dotfiles/kitty | cp ~/.config/kitty/kitty.conf ~/.config/dotfiles/kitty
mkdir ~/.config/dotfiles/lazygit | cp ~/.config/lazygit/config.yml ~/.config/dotfiles/lazygit
