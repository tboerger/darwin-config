{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "gh-dash";
  version = "3.14.0";

  src = fetchFromGitHub {
    owner = "dlvhdr";
    repo = "gh-dash";
    rev = "v${version}";
    sha256 = "sha256-6YPUGOQ2KBfu+3XAgub9Cpz0QBrU2kV+gq13tUtzY+w=";
  };

  vendorHash = "sha256-jCf9FWAhZK5hTzyy8N4r5dfUYTgESmsn8iKxCccgWiM=";

  ldflags = [
    "-s"
    "-w"
    "-X main.Version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/dlvhdr/gh-dash";
    description = "gh extension to show a dashboard on cli";
    license = licenses.mit;
    maintainers = with maintainers; [ tboerger ];
  };
}
