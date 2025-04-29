# =====================
# Basic
# =====================
ZSH_DIR="$HOME/.zsh"

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

setopt histignorealldups sharehistory

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
# End of lines added by compinstall



# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完で小文字も大文字にマッチさせる
setopt list_packed # 補完候補を詰めて表示
zstyle ':completion:*' list-colors '' # 補完をカラー表示
# setopt correct # 誤記を訂正
# 
# #補完に関するオプション
# setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
# setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
# setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
# setopt auto_param_keys       # カッコの対応などを自動的に補完
# setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word      # 語の途中でもカーソル位置で補完
# setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
# 
# setopt print_eight_bit # 日本語ファイル名等8ビットを通す
# setopt extended_glob # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
# setopt globdots # 明確なドットの指定なしで.から始まるファイルをマッチ
# 
# bindkey "^I" menu-complete   # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)
# 
# zstyle ':completion:*:default' menu select=2
# 
zstyle ':completion:*' completer _complete _approximate _prefix # 近似補完




# =====================
# Alias
# =====================
alias ls='ls -F --color=auto --group-directories-first'
alias ll='ls -hl'
alias la='ll -A'
alias grep='grep --color'
alias aws='aws --profile mysso'



# =====================
# Environment
# =====================
export GOPATH=~/go
# export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:$HOME/.local/npm_global/bin"




# =====================
# Plugin
# =====================
if [ ! -d $ZSH_DIR ]; then
  mkdir -p ${ZSH_DIR}/plugin
fi
if [ ! -d ${ZSH_DIR}/plugin/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR/plugin/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_DIR/plugin/zsh-autosuggestions
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_DIR/plugin/powerlevel10k
fi

source $ZSH_DIR/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_DIR/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_DIR/plugin/powerlevel10k/powerlevel10k.zsh-theme

# autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=11"

# powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# =====================
# Command
# =====================

. "$HOME/.local/bin/env"
