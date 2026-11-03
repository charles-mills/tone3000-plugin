{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cmake
    ninja
    pkg-config
    clang
    clang-tools
    git
  ];
  buildInputs = with pkgs; [
    alsa-lib
    fontconfig
    freetype
    gtk3
    curl
    libjack2
    libGL
    sysprof
    libx11
    libxcursor
    libxext
    libxinerama
    libxrandr
    libxi
    libxscrnsaver
  ];
  packages = with pkgs; [
    python3
    imagemagick
    jq
    xorg-server
    xwininfo
    xprop
    xdotool
    openbox
    wmctrl
    bubblewrap
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
    with pkgs;
    [
      alsa-lib
      fontconfig
      freetype
      curl
      libjack2
      libGL
      libx11
      libxcursor
      libxext
      libxinerama
      libxrandr
      libxi
      libxscrnsaver
    ]
  );
}
