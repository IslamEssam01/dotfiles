mkdir $HOME/.config/dotfiles
cp $HOME/.config/copyDotfiles.sh $HOME/.config/dotfiles/
cp -r $HOME/.config/nvim/ $HOME/.config/dotfiles/
cp -r $HOME/.config/i3/ $HOME/.config/dotfiles/
cp -r $HOME/.config/i3blocks/ $HOME/.config/dotfiles/
cp -r $HOME/.config/rofi/ $HOME/.config/dotfiles/
mkdir $HOME/.config/dotfiles/fish | cp -r $HOME/.config/fish/functions/ $HOME/.config/fish/config.fish $HOME/.config/dotfiles/fish
mkdir $HOME/.config/dotfiles/nnn | cp -r $HOME/.config/nnn/plugins $HOME/.config/dotfiles/nnn
mkdir $HOME/.config/dotfiles/tmux | cp $HOME/.config/tmux/tmux.conf $HOME/.config/dotfiles/tmux
mkdir $HOME/.config/dotfiles/kitty | cp $HOME/.config/kitty/kitty.conf $HOME/.config/dotfiles/kitty
mkdir $HOME/.config/dotfiles/lazygit | cp $HOME/.config/lazygit/config.yml $HOME/.config/dotfiles/lazygit
