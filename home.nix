{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # inputs.nixvim.homeManagerModules.nixvim
    ./nixvim.nix
    ./terminals.nix
    ./tmux.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "amadeus";
  home.homeDirectory = "/home/amadeus";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "cudaPackages.cudatoolkit"
      "cuda-merged"
      "cuda_cuobjdump"
      "cuda_gdb"
      "cuda_nvcc"
      "cuda_nvdisasm"
      "cuda_nvprune"
      "cuda_cccl"
      "cuda_cudart"
      "cuda_cupti"
      "cuda_cuxxfilt"
      "cuda_nvml_dev"
      "cuda_nvrtc"
      "cuda_nvtx"
      "cuda_profiler_api"
      "cuda_sanitizer_api"
      "libcublas"
      "libcufft"
      "libcurand"
      "libcusolver"
      "libnvjitlink"
      "libcusparse"
      "libnpp"
    ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    hello
    fabric-ai
    git-credential-oauth
    eza
    nettools
    openrgb-with-all-plugins
    kubectl
    xclip
    nh
    nerd-fonts.jetbrains-mono
    gnome-boxes
    deluge
    just
    rustscan
    rustup
    bacon
    gccgo14
    qogir-kde
    sweet-nova
    arc-kde-theme
    qogir-icon-theme
    catppuccin-cursors
    tela-circle-icon-theme
    prismlauncher
    nettools
    nodejs_22
    tpi
    crane
    talosctl
    kubie
    kubectl
    xclip
    hcloud
    jq
    pnpm
    rainfrog
    lazydocker
    gparted
    steam-devices-udev-rules
    rclone
    vulnix
    mangojuice
    tor
    tor-browser
    dprint
    nvtopPackages.full
    kubernetes-helm
    helm-ls
    helmsman
    helmfile
    duckdb
    sqlite
    sqlitestudio
    sqlite-analyzer
    bat
    harlequin
    cargo-binstall
    dioxus-cli
    file
    wasm-bindgen-cli
    pwgen
    devenv
    nix-prefetch
    nix-prefetch-github
    glow
    pkg-configUpstream
    dive
    duckdb
    ladybird
    # sql-studio
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/amadeus/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.sessionPath = [
    "/var/lib/flatpak/exports/share"
    "/home/amadeus/.local/share/flatpak/exports/share"
  ];
  programs.zsh = {
    enable = true;
    autocd = true;
    zprof.enable = false;
    historySubstringSearch.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion = {
      enable = true;
    };
    shellAliases = {
      l = "ls -lah";
      lg = "lazygit";
      k = "kubectl";
      flk = "cd ~/myflakes";
      dps = "docker compose ps";
      dup = "docker compose up -d --build --remove-orphans";
      dwn = "docker compose down";
      ld = "lazydocker";
    };
    oh-my-zsh = {
      enable = true;
      # theme = "wezm";
      theme = "tonotdo";
    };
  };

  programs.librewolf = {
    enable = true;
    languagePacks = ["en-US"];
    settings = {
      "privacy.resistFingerprinting.letterboxing" = true;
      "webgl.disabled" = false;
      "identity.fxaccounts.enabled" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.history" = false;
    };
  };

  programs.fastfetch = {
    enable = true;
  };
  programs.ripgrep = {
    enable = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  programs.k9s = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.git = {
    enable = true;
    userName = "Amadeus Mader";
    userEmail = "amadeus@mozart409.com";
    ignores = [
      "*~"
      "*.swp"
    ];
    aliases = {
      ci = "commit";
      s = "status";
      f = "fetch";
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
      credential = {
        helper = "oauth";
        cache = "--timeout 21600";
      };
    };
  };
  programs.lazygit = {
    enable = true;
    settings.gui.theme = {
      activeBorderColor = [
        "#89b4fa"
        "bold"
      ];
      inactiveBorderColor = ["#a6adc8"];
      optionsTextColor = ["#89b4fa"];
      selectedLineBgColor = ["#313244"];
      selectedRangeBgColor = ["#313244"];
      unstagedChangesColor = ["#f38ba8"];
      defaultFgColor = ["#cdd6f4"];
      searchingActiveBorderColor = ["#f9e2af"];
    };
  };

  programs.plasma = {
    enable = false;
    workspace = {
      lookAndFeel = "com.github.vinceliuice.Qogir-dark";
      cursor = {
        theme = "Qogir-manjaro";
        size = 30;
      };
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Qogir-ubuntu-dark/contents/image/1920x1080.jpg";
    };
    kwin = {
      edgeBarrier = 0; # Disables the edge-barriers introduced in plasma 6.1
      cornerBarrier = false;
      scripts.polonium.enable = false;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
