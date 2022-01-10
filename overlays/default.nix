self: super:

{
  alfred = super.callPackage ./alfred {};
  clickup = super.callPackage ./clickup {};
  deezer = super.callPackage ./deezer {};
  discord = super.callPackage ./discord {};
  franz = super.callPackage ./franz {};
  google-chrome = super.callPackage ./google-chrome {};
  iterm2 = super.callPackage ./iterm2 {};
  keepingyouawake = super.callPackage ./keepingyouawake {};
  mattermost-desktop = super.callPackage ./mattermost-desktop {};
  microsoft-teams = super.callPackage ./microsoft-teams {};
  rectangle = super.callPackage ./rectangle {};
  signal = super.callPackage ./signal {};
  hammerspoon = super.callPackage ./hammerspoon {};
  # anyconfig = super.callPackage ./anyconfig {};
  # ansible-later = super.callPackage ./ansible-later {};
}
