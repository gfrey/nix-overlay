# Overlays From Git

This is an example on how to use a Nix overlay fetched from Git.
The benefit being, that this will automatically keep up to date.

## Configuration

Assuming that Nix package manager is installed, creating `~/.config/nixpkgs/overlays.nix` with the following content will suffice.

	[
	  (import (builtins.fetchGit {
		url = "git@github.com:gfrey/nix-overlay.git";
		ref = "master";
	  }))
	]

There is also the option to have a directory `~/.config/nixpkgs/overlay/` containing overlay definitions.
See the [documentation](https://nixos.org/manual/nixpkgs/stable/#chap-overlays) for more details.

## Using The Overlay

With this configured it is possible to install the packages from the overlay, e.g. try `nix-shell -p smutje`.

There is a catch so: Nix has a caching layer, to not constantly have to fetch repositories.
This cache has a TTL of 3600s by default.
It can be controlled using the `tarball-ttl` option.
So in case a package was updated and it needs to be picked faster than that, the following is possible:

	nix-shell -p smutje --tarball-ttl 0

This effectively disables the caching and always fetches the latest copy.
For more details see the documentation of [tarball-ttl](https://nixos.org/manual/nix/stable/#conf-tarball-ttl) and [fetchGit](https://nixos.org/manual/nix/stable/#builtin-fetchGit).

## Conclusion

This allows for easily having a remote source for the overlay.
It reduces the user's tasks to

* Installing Nix package manager.
* Call a simple command, that will set up the overlay.

The caching is a nuisance, but not having it, would also add a lot of delay to each and every call.
It is something to keep in mind.
