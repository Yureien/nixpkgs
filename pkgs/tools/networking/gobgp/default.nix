{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "gobgp";
  version = "3.7.0";

  src = fetchFromGitHub {
    owner = "osrg";
    repo = "gobgp";
    rev = "v${version}";
    sha256 = "sha256-3Brm9pWCLCSjNE5ZACAV4K34L3oBfvT9VI4TKMXrmgY=";
  };

  vendorSha256 = "sha256-FxfER3THsA7NRuQKEdWQxgUN0SiNI00hGUMVD+3BaG4=";

  postConfigure = ''
    export CGO_ENABLED=0
  '';

  ldflags = [
    "-s" "-w" "-extldflags '-static'"
  ];

  subPackages = [ "cmd/gobgp" ];

  meta = with lib; {
    description = "A CLI tool for GoBGP";
    homepage = "https://osrg.github.io/gobgp/";
    license = licenses.asl20;
    maintainers = with maintainers; [ higebu ];
  };
}
