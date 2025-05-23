{ config, pkgs,lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ryann";
  home.homeDirectory = "/home/ryann";
  #import modules
  imports = [ ./../../modules/homemanager ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName  = "Anseryde";
    userEmail = "ryanlupis@gmail.com";
    extraConfig = {
      credential = {
      	helper = "manager";
      	"https://github.com".username = "Anseryde";
      	credentialStore = "cache";
      };
      push = { autoSetupRemote = true; };
    };
  };
  # fontconfig support
  fonts = {
  	fontconfig = {
  	  enable = true;
  	};
  };
  home.packages = with pkgs; [
  	fastfetch
  	hyfetch
  	fishPlugins.fzf-fish
  	courier-prime
  	vollkorn
  	gimp3-with-plugins
  	prismlauncher
  	unityhub
  	tela-icon-theme
  	thunderbird-latest
  	wqy_microhei
  	wqy_zenhei
  	texlivePackages.arphic-ttf
  	github-desktop
  	heroic
  	git-credential-manager
  ];
  services.flatpak.enable = true;
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];
  services.flatpak.packages = [
      { appId = "org.openmw.OpenMW"; origin = "flathub-beta";  }
      "com.obsproject.Studio"
      #"org.wezfurlong.wezterm"
      "io.github.limo_app.limo"
      "info.febvre.Komikku"
      "com.bitwarden.desktop"
      "com.calibre_ebook.calibre"
      "com.discordapp.Discord"
      "com.github.ADBeveridge.Raider"
      "com.github.Matoking.protontricks"
      "com.github.mtkennerly.ludusavi"
      "com.spotify.Client"
      "com.stremio.Stremio"
      "io.github.dvlv.boxbuddyrs"
      "io.github.flattool.Warehouse"
      "io.github.loot.loot"
      "io.github.peazip.PeaZip"
      "io.itch.itch"
      "md.obsidian.Obsidian"
      "net.davidotek.pupgui2"
      "net.epson.epsonscan2"
      "org.audacityteam.Audacity"
      "org.beeref.BeeRef"
      "org.gustavoperedo.FontDownloader"
      "org.kde.krita"
      "org.telegram.desktop"
      "dev.pulsar_edit.Pulsar"
    ];
  services.flatpak.overrides = {
  	#"org.wezfurlong.wezterm".Context.devices = ["!dri"];
  };
  services.flatpak.update.onActivation = true;
  services.flatpak.uninstallUnmanaged = true;
  programs.fish = {
  	enable = true;
  };
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "en-GB" "zh-CN" "zh-TW" ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = false;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles = {
      user = {
        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
        };
        settings = {
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
          "sidebar.visibility" = "expand-on-hover";
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "widget.use-xdg-desktop-portal.location" = 1;
          "widget.use-xdg-desktop-portal.mime-handler" = 1;
          "widget.use-xdg-desktop-portal.native-messaging" = 1;
          "widget.use-xdg-desktop-portal.open-uri" = 1;
          "widget.use-xdg-desktop-portal.settings" = 1;
        };
      };
    };
  };
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}
      config.color_scheme = 'Ibm3270 (Gogh)'
      config.font = wezterm.font 'Courier Prime'
      config.font_size = 12.0

      return config
    '';
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
