with import <nixpkgs> {};

let
    redis-307 = stdenv.mkDerivation rec {
    name = "redis-307";
    src = fetchurl {
       url = "http://download.redis.io/releases/redis-3.0.7.tar.gz";
       sha256 = "b2a791c4ea3bb7268795c45c6321ea5abcc24457178373e6a6e3be6372737f23";
       };
    propagatedBuildInputs = [ lua ];
       makeFlags = "PREFIX=$(out)";
       checkPhase = ''make test
       '';
       doCheck = false;
       dontStrip = true;
       };

     pyredis = python27Packages.buildPythonPackage rec {
         name = "pyredis";
         src = fetchurl {
           url = "https://pypi.python.org/packages/68/44/5efe9e98ad83ef5b742ce62a15bea609ed5a0d1caf35b79257ddb324031a/redis-2.10.5.tar.gz";
           md5 = "3b26c2b9703b4b56b30a1ad508e31083";
           };
       propagatedBuildInputs = [ redis-307 ];
       checkPhase = ''
       '';
       doCheck = false;
       dontStrip = true;
       };
in

stdenv.mkDerivation {
  name = "PythonMyRedis";
  buildInputs = [
     git
     redis-307
     python27Full
     python27Packages.virtualenv
     pyredis
     ];
      src = null;
      # When used as `nix-shell --pure`
      shellHook = ''
      export SOURCE_DATE_EPOCH=315532800
      unset http_proxy
      export GIT_SSL_CAINFO=/etc/ssl/certs/ca-bundle.crt
      '';
      # used when building environments
      extraCmds = ''
      unset http_proxy # otherwise downloads will fail ("nodtd.invalid")
      export SOURCE_DATE_EPOCH=315532800
      export GIT_SSL_CAINFO=/etc/ssl/certs/ca-bundle.crt
      '';
    }
