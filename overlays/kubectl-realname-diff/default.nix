{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "kubectl-realname-diff";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "hhiroshell";
    repo = "kubectl-realname-diff";
    rev = "v${version}";
    sha256 = "sha256-Ej0O5tcHdXHzDSf6aHLgyeYGRv5RbXJMZcyHDyRjLV4=";
  };

  vendorHash = "sha256-XJZ9/JKj+WT3TffNP1Z0y5jws2wqZotzzV/1pk+AJkU=";

  doCheck = false;
  subPackages = [ "cmd/kubectl-realname_diff" ];

  meta = with lib; {
    description = "A kubectl plugin that diffs live and local resources ignoring Kustomize hash-suffixes";
    homepage = "https://github.com/hhiroshell/kubectl-realname-diff/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
