## NixPie

Repo intended to showcase introductory nix-shell configurations for Python developers.

### Howto

* The docker way - check out the repo (let's say to ~/Code)
* Then run the Nix docker container:

```
$ docker run --rm -it -v ~/Code/nixpie/:/srv nixos/nix bash
bash-4.3# ls /srv/00-PyRedis/
00-PyRedis            01-CustomPyRedis      02-Python-2.7-scrapy  03-Python-3.5-scrapy  05-OverrideRedis      README.md
bash-4.3# cd /srv/00-PyRedis/
bash-4.3# nix-shell .
```

* This will build the nix-shell environment defined in `default.nix`. Try running `redis-server &` followed by `python test_redis.py`
* Or [install Nix](https://nixos.org/nix/download.html) on your Linux/MacOS, checkout the repo and then run `nix-shell .` from the desired example directory.
