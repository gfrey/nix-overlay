{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGo115Module rec {
  pname = "hdrt";
  version = "master";

  src = fetchGit{
    url = "git@github.com:gfrey/hdrt.git";
    # ref = version;
  };

  vendorSha256 = "sha256:1n280aiqja5kb5j1yc7wx9a6gwan19375xw495ixl31wynsf9xyg";

  meta = with pkgs.lib; {
    description = "A simple raytracer";
    homepage = https://github.com/gfrey/hdrt;
    license = licenses.bsd3;
    maintainers = "Gereon Frey";
  };
}

