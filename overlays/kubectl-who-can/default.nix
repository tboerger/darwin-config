{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-who-can";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "aquasecurity";
    repo = "kubectl-who-can";
    rev = "v${version}";
    sha256 = "sha256-nyUDzNxlizSr3P3dh9Cz/9CaMfmjeE9qSJkCLo4lBqw=";
  };

  vendorHash = "sha256-KWLuS29aI3XqqyJAY9DVX+ldFU53vEumpBKUwinhYGQ=";

  doCheck = false;
  subPackages = [ "cmd/kubectl-who-can" ];

  postInstall = ''
    mv $out/bin/kubectl-who-can $out/bin/kubectl-who_can
  '';

  meta = with lib; {
    description = "A kubectl plugin to show who has RBAC permissions";
    homepage = "https://github.com/aquasecurity/kubectl-who-can/";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
