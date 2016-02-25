dotfiles
========

Personal dotfiles

### Manual Setup

Create symbolic links from the files in the repo to home dir. For example:

```
cd ~
ln -s /path/to/repo/.gitconfig .gitconfig
```

#### VIM

For `.vimrc` file [Vundle](https://github.com/VundleVim/Vundle.vim) is required. Install it cloning the repository, fireup vim and run the `PluginInstall` command.

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Also, the currently configured color scheme is [solarized](http://ethanschoonover.com/solarized). See instructions below.

##### Ubuntu

Install [gnome terminal colors solarized](https://github.com/Anthony25/gnome-terminal-colors-solarized)

* Make sure you have `dconf` installed;
* `git clone https://github.com/Anthony25/gnome-terminal-colors-solarized /opt/gnome-terminal-colors-solarized`;
* `/opt/gnome-terminal-colors-solarized/install.sh`;
* follow instructions to install `dark alternative`;
