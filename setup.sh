# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting.
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Make symbolic links for themes.
ln -sf $(pwd)/ys-light.zsh-theme ~/.oh-my-zsh/themes
ln -sf $(pwd)/bullet-train.zsh-theme ~/.oh-my-zsh/themes

# Make symbolic links for zshrc.
ln -sf $(pwd)/zshrc ~/.zshrc
