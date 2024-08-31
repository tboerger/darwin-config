{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-ktop";
  version = "0.3.5";

  src = fetchFromGitHub {
    owner = "vladimirvivien";
    repo = "ktop";
    rev = "v${version}";
    sha256 = "sha256-nkIRVt2kqsE9QBYvvHmupohnzH+OBcwWwV16rMePw4I=";
  };

  vendorHash = "sha256-IiAMmHOq69WMT2B1q9ZV2fGDnLr7AbRm1P7ACSde2FE=";

  doCheck = false;
  subPackages = [ "." ];

  postInstall = ''
    mv $out/bin/ktop $out/bin/kubectl-ktop
  '';

  meta = with lib; {
    description = "A top-like tool for your Kubernetes clusters";
    homepage = "https://github.com/vladimirvivien/ktop/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
