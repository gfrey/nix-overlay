self: super:

{
  smutje = super.callPackage ./pkgs/golang/smutje { pkgs = self; };
  hdrt   = super.callPackage ./pkgs/golang/hdrt   { pkgs = self; };
}
