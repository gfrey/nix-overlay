self: super:

{
  smutje = super.callPackage ./pkgs/golang/smutje { pkgs = self; };
}
