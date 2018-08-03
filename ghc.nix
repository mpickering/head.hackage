# Specify the precise commit of GHC that we are going to use by default
nixpkgs:
let spec =
  {
    version = "8.6.1.20180803";
    src =
      nixpkgs.fetchgit {
        url = "git://git.haskell.org/ghc.git";
        rev = "e86db0d59dc2f9d8f4140c6b3052762a1ae82428";
        sha256 = "0w5sdbgv5mjc96v5s0skscizp1ndvcdvf54r15zfpz7cdfcg31km";
      };
  };
in

(nixpkgs.haskell.compiler.ghcHEAD.override
    { version = spec.version
    ; bootPkgs = nixpkgs.haskell.packages.ghc822; }).overrideAttrs(oldAttrs:
    { src = spec.src; })

