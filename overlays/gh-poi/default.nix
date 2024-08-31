{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "gh-poi";
  version = "0.9.8";

  src = fetchFromGitHub {
    owner = "seachicken";
    repo = "gh-poi";
    rev = "v${version}";
    sha256 = "sha256-QpUZxho9hzmgbCFgNxwwKi6hhfyqc4b/JYKH3rP4Eb8=";
  };

  vendorHash = "sha256-D/YZLwwGJWCekq9mpfCECzJyJ/xSlg7fC6leJh+e8i0=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/seachicken/gh-poi";
    description = "gh extension to clean up your local branches";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
