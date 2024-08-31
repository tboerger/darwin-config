{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-outdated";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "replicatedhq";
    repo = "outdated";
    rev = "v${version}";
    sha256 = "sha256-01rQAGSoAD/lMHSth4FvYXnvpW2zyXGQNKq70HQKPFU=";
  };

  vendorHash = "sha256-EbLIsOqg4uQB6ER/H05zaFC6sTxCPIQUZUhRgW1i9KQ=";

  doCheck = false;
  subPackages = [ "cmd/outdated" ];

  postInstall = ''
    mv $out/bin/outdated $out/bin/kubectl-outdated
  '';

  meta = with lib; {
    description = "A kubectl plugin to find and report outdated images";
    homepage = "https://github.com/replicatedhq/outdated/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
