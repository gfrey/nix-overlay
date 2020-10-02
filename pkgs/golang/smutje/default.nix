{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGo115Module rec {
  pname = "smutje";
  version = "master";

  src = fetchGit{
    url = "git@github.com:gfrey/smutje.git";
    # ref = version;
  };

  vendorSha256 = "sha256:02h3gnz8rpd55vk7ab5hiaiaxabf42mpwi4fa0g3gzhrh5xdp5z6";
  subPackages = [ "." "./cmds/smutje" "./cmds/smd-fmt" ];
  meta = with pkgs.lib; {
    description = "Provisioning done right";
    homepage = https://github.com/gfrey/smutje;
    license = licenses.bsd3;
    maintainers = "Gereon Frey";
  };
}

