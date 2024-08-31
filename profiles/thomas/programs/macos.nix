{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.macos;

in
{
  options = {
    profile = {
      programs = {
        macos = {
          enable = mkEnableOption "MacOS" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    # system = {
    #   defaults = {
    #     LaunchServices = {
    #       LSQuarantine = false;
    #     };

    #     NSGlobalDomain = {
    #       # AppleFontSmoothing = 2;
    #       # AppleKeyboardUIMode = 3;
    #       AppleMeasurementUnits = "Centimeters";
    #       AppleMetricUnits = 1;
    #       ApplePressAndHoldEnabled = true;
    #       AppleShowAllExtensions = false;
    #       AppleShowScrollBars = "Always";
    #       AppleTemperatureUnit = "Celsius";
    #       # InitialKeyRepeat = 1;
    #       # KeyRepeat = 1;
    #       NSAutomaticCapitalizationEnabled = false;
    #       NSAutomaticDashSubstitutionEnabled = false;
    #       NSAutomaticPeriodSubstitutionEnabled = false;
    #       NSAutomaticQuoteSubstitutionEnabled = false;
    #       NSAutomaticSpellingCorrectionEnabled = false;
    #       NSDisableAutomaticTermination = false;
    #       NSDocumentSaveNewDocumentsToCloud = false;
    #       NSNavPanelExpandedStateForSaveMode = true;
    #       NSNavPanelExpandedStateForSaveMode2 = true;
    #       NSScrollAnimationEnabled = false;
    #       NSTableViewDefaultSizeMode = 2;
    #       NSTextShowsControlCharacters = true;
    #       NSUseAnimatedFocusRing = false;
    #       # NSWindowResizeTime = 0.20;
    #       PMPrintingExpandedStateForPrint = true;
    #       PMPrintingExpandedStateForPrint2 = true;
    #       "com.apple.mouse.tapBehavior" = 1;
    #       "com.apple.swipescrolldirection" = true;
    #       "com.apple.trackpad.enableSecondaryClick" = true;
    #       "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
    #     };

    #     SoftwareUpdate = {
    #       AutomaticallyInstallMacOSUpdates = true;
    #     };

    #     dock = {
    #       autohide = true;
    #       autohide-delay = 0.2;
    #       mineffect = "scale";
    #       show-recents = false;
    #       tilesize = 32;
    #       largesize = 64;
    #       magnification = true;

    #       wvous-tl-corner = 2;
    #       wvous-bl-corner = 3;
    #       wvous-tr-corner = 2;
    #       wvous-br-corner = 3;
    #     };

    #     finder = {
    #       AppleShowAllExtensions = false;
    #       FXEnableExtensionChangeWarning = false;
    #       QuitMenuItem = true;
    #       _FXShowPosixPathInTitle = true;
    #     };

    #     loginwindow = {
    #       DisableConsoleAccess = true;
    #       GuestEnabled = false;
    #       # LoginwindowText = "";
    #       PowerOffDisabledWhileLoggedIn = true;
    #       RestartDisabledWhileLoggedIn = true;
    #       ShutDownDisabledWhileLoggedIn = true;
    #       SHOWFULLNAME = true;
    #     };

    #     screencapture = {
    #       location = "${config.home.homeDirectory}/Pictures/Screenshots";
    #     };

    #     trackpad = {
    #       ActuationStrength = 1;
    #       Clicking = true;
    #       FirstClickThreshold = 1;
    #       SecondClickThreshold = 1;
    #       TrackpadRightClick = true;
    #       TrackpadThreeFingerDrag = true;
    #     };
    #   };
    # };
  };
}
