# Windows Terminal 配置

## 配色 & NerdFont

[在线选择配色](https://atomcorp.github.io/themes/)

![配置](https://i.loli.net/2020/08/06/NHpXngi7u6oMjfb.png)

![添加到配置文件当中](https://i.loli.net/2020/08/06/iSdKvReYHcF5M1N.png)


## 快捷键

| 按键              | 功能         |
|-------------------|--------------|
| alt + shift + d   | 分屏         |
| alt + j           | 移到左边窗口 |
| alt + k           | 移到下边窗口 |
| alt + l           | 移到右边窗口 |
| alt + i           | 移到上边窗口 |
| ctrl + shifit + j | 上滚屏幕     |
| ctrl + shift + k  | 下滚屏幕     |
| ctrl + b          | 往回移动光标 |
| ctrl + f          | 往后移动光标 |
| ctrl + a          | 移到头部     |
| ctrl + e          | 移到尾部     |
| ctrk + p          | 上一个命令   |
| ctrl + n          | 下一个命令   |
| alt + b           | 前一个单词   |
| alt + f           | 下一个单词   |

## 修改WSL下`ls`指令的底色
修改`~/.profile`，在其中添加

```bash
# for ls colors
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"
export LS_COLORS
```
## WSL下的`fish_config`
1. 打开`/usr/share/fish/tools/web_config`下的`webconfig.py`
2. 用`chmod 777 webconfig.py`为`webconfig.py`添加权限
3. 修改`webconfig.py`中的`fileurl`为`fileurl = file://wsl%24/Ubuntu-18.04 + f.name`
4. 用`chmod 644 webconfig.py`修改权限
![WSL下的fish_config](https://i.loli.net/2020/08/06/CEBDXeI3O4JYkvW.png)

## ref

[ls底色问题](https://www.jianshu.com/p/c0a7506b58b2)

[解决wsl下的fish_config](https://github.com/fish-shell/fish-shell/issues/4299)

