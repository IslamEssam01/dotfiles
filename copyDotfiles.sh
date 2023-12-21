mkdir dotfiles
cp copyDotfiles.sh dotfiles/
mkdir dotfiles/fish | cp -r fish/functions/ fish/config.fish dotfiles/fish
mkdir dotfiles/tmux | cp tmux/tmux.conf dotfiles/tmux
mkdir dotfiles/nvim | cp -r nvim/ dotfiles/
mkdir dotfiles/kitty | cp kitty/kitty.conf dotfiles/kitty
mkdir dotfiles/lazygit | cp lazygit/config.yml dotfiles/lazygit
