{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.macos;

in

{
  options = with lib; {
    my = {
      modules = {
        macos = {
          enable = mkEnableOption ''
            Whether to enable macos module
          '';
        };
      };
    };

    system.defaults.dock.wvous-tl-corner = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Hot corner action for top left corner
      '';
    };

    system.defaults.dock.wvous-bl-corner = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Hot corner action for bottom left corner
      '';
    };

    system.defaults.dock.wvous-tr-corner = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Hot corner action for top right corner
      '';
    };

    system.defaults.dock.wvous-br-corner = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Hot corner action for bottom right corner
      '';
    };

    system.defaults.dock.largesize = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Large size of the icons in the dock.  The default is 64.
      '';
    };

    system.defaults.dock.magnification = mkOption {
      type = types.nullOr types.bool;
      default = null;
      description = ''
        Enable magnification for the icons in the dock.  The default is false.
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        taps = [
          "homebrew/cask"
        ];

        casks = [
          "swiftdefaultappsprefpane"
        ];

        brews = [
          "mas"
        ];

        masApps = {
          "1Password 7" = 1333542190;
          "Xcode" = 497799835;
          "The Unarchiver" = 425424353;
        };
      };

      environment = {
        systemPackages = with pkgs; [
          m-cli
        ];
      };

      system = {
        defaults = {
          LaunchServices = {
            LSQuarantine = false;
          };

          NSGlobalDomain = {
            # AppleFontSmoothing = 2;
            # AppleKeyboardUIMode = 3;
            AppleMeasurementUnits = "Centimeters";
            AppleMetricUnits = 1;
            ApplePressAndHoldEnabled = true;
            AppleShowAllExtensions = false;
            AppleShowScrollBars = "Always";
            AppleTemperatureUnit = "Celsius";
            # InitialKeyRepeat = 1;
            # KeyRepeat = 1;
            NSAutomaticCapitalizationEnabled = false;
            NSAutomaticDashSubstitutionEnabled = false;
            NSAutomaticPeriodSubstitutionEnabled = false;
            NSAutomaticQuoteSubstitutionEnabled = false;
            NSAutomaticSpellingCorrectionEnabled = false;
            NSDisableAutomaticTermination = false;
            NSDocumentSaveNewDocumentsToCloud = false;
            NSNavPanelExpandedStateForSaveMode = true;
            NSNavPanelExpandedStateForSaveMode2 = true;
            NSScrollAnimationEnabled = false;
            NSTableViewDefaultSizeMode = 2;
            NSTextShowsControlCharacters = true;
            NSUseAnimatedFocusRing = false;
            # NSWindowResizeTime = 0.20;
            PMPrintingExpandedStateForPrint = true;
            PMPrintingExpandedStateForPrint2 = true;
            "com.apple.mouse.tapBehavior" = 1;
            "com.apple.swipescrolldirection" = true;
            "com.apple.trackpad.enableSecondaryClick" = true;
            "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
          };

          SoftwareUpdate = {
            AutomaticallyInstallMacOSUpdates = true;
          };

          dock = {
            autohide = true;
            autohide-delay = "0.2";
            mineffect = "scale";
            show-recents = false;
            tilesize = 32;
            largesize = 64;
            magnification = true;

            wvous-tl-corner = 2;
            wvous-bl-corner = 3;
            wvous-tr-corner = 2;
            wvous-br-corner = 3;
          };

          finder = {
            AppleShowAllExtensions = false;
            FXEnableExtensionChangeWarning = false;
            QuitMenuItem = true;
            _FXShowPosixPathInTitle = true;
          };

          loginwindow = {
            DisableConsoleAccess = true;
            GuestEnabled = false;
            # LoginwindowText = "";
            PowerOffDisabledWhileLoggedIn = true;
            RestartDisabledWhileLoggedIn = true;
            ShutDownDisabledWhileLoggedIn = true;
            SHOWFULLNAME = true;
          };

          screencapture = {
            location = "/Users/${config.my.username}/Pictures/Screenshots";
          };

          trackpad = {
            ActuationStrength = 1;
            Clicking = true;
            FirstClickThreshold = 1;
            SecondClickThreshold = 1;
            TrackpadRightClick = true;
            TrackpadThreeFingerDrag = true;
          };
        };
      };
    };
}
