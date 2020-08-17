# 配置

## nvim
### coc

+ coc.snippets
+ coc.python

## zsh
+ 安装zsh
```sh
sudo apt-get install zsh
```

+ 安装zplug
```sh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

+ 安装oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
+ 安装pure
```sh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

+ 拷贝配置
```sh
cp /dotfiles/zsh/.zshrc ~/.zshrc
source ~/.zshrc
```

## fzf
+ 安装fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install
```

+ 安装[fd](https://github.com/chinanf-boy/fd-zh#%E5%AE%89%E8%A3%85)

```sh
sudo dpkg -i fd_7.0.0_amd64.deb  # adapt version number and architectur
```

+ 安装ripgrep
```sh
sudo apt-get install ripgrep
```

## ranger

