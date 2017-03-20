with import <nixpkgs> {};
with pkgs.python27Packages;

buildPythonPackage {
  name = "ScrapyDevEnv";
  buildInputs = [
     git
     scrapy
     twisted
     service-identity
     virtualenv
     cffi
     twisted
     lxml
     parsel
     six
     pydispatcher
     service-identity
     pyopenssl
     queuelib
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
