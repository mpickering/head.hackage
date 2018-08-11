# Specify the precise commit of GHC that we are going to use by default
nixpkgs:
let spec =
  {
    version = "8.6.1.20180811";
    src =
      nixpkgs.fetchgit {
        url = "git://git.haskell.org/ghc.git";
        rev = "ghc-8.6.1-beta1";
        sha256 = "0a60xlj7qgbqndx93b8lk6fmg7x62nq23p79k79cfrg0shmhb7xi";
      };
  };
in

(nixpkgs.haskell.compiler.ghcHEAD.override
    { version = spec.version
    ; bootPkgs = nixpkgs.haskell.packages.ghc822; }).overrideAttrs(oldAttrs:
    { src = spec.src
    ; patches = [./D5048.diff]; })

