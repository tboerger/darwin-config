{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "protoc-gen-openapiv2";
  version = "2.12.0";

  src = fetchFromGitHub {
    owner = "grpc-ecosystem";
    repo = "grpc-gateway";
    rev = "v${version}";
    sha256 = "sha256-OthyGEMVQnK0jN9svlfAZUl52lt19jtLd1Oj3cuirx4=";
  };

  vendorSha256 = "sha256-UjwpFjHVaQT4irhbt2GGlYeNhDs9Dv73PcHKhMrQfQs=";

  subPackages = [ "protoc-gen-openapiv2" ];

  meta = with lib; {
    description = "OpenAPI v2 support for Google's protocol buffers";
    homepage = "https://grpc-ecosystem.github.io/grpc-gateway/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ tboerger ];
  };
}
