# Dracula

## iTerm

```
curl -sSL Dracula.itermcolors https://raw.githubusercontent.com/dracula/iterm/refs/tags/v1.2.5/Dracula.itermcolors
open Dracula.itermcolors
rm -f Dracula.itermcolors
```

## Alfdred

```
curl -sSLo Dracula.alfredappearance https://raw.githubusercontent.com/dracula/alfred/refs/tags/v1.2.5/Dracula.alfredappearance
open Dracula.alfredappearance
rm -f Dracula.alfredappearance
```

## LimeChat

```
LIMECHAT_PATH=~/Library/Application\ Support/net.limechat.LimeChat-AppStore/Themes

mkdir -p "${LIMECHAT_PATH}"
curl -sSLo "${LIMECHAT_PATH}/Dracula.yaml" https://raw.githubusercontent.com/dracula/limechat/refs/heads/master/Dracula.yaml
curl -sSLo "${LIMECHAT_PATH}/Dracula.css" https://raw.githubusercontent.com/dracula/limechat/refs/heads/master/Dracula.css
defaults write net.limechat.LimeChat-AppStore Preferences.Theme.name user:Dracula

unset LIMECHAT_PATH
```

## MacDown

```
MACDOWN_PATH=~/Library/Application\ Support/MacDown/Themes

mkdir -p "${MACDOWN_PATH}"
curl -sSLo "${MACDOWN_PATH}/Dracula.style" https://raw.githubusercontent.com/dracula/macdown/refs/heads/master/Dracula.style
defaults write com.uranusjr.macdown editorStyleName Dracula

unset MACDOWN_PATH
```

## GitHub Dash

```
mkdir -p ~/.config/gh-dash
curl -sSLo ~/.config/gh-dash/config.yml https://raw.githubusercontent.com/dracula/gh-dash/refs/heads/main/config.yml
```

## Builtin

* Joplin
