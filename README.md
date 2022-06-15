# Liste_des_certificats_de_beneficiaires_frauduleux_des_avantages_durables
「持続化給付金の不正受給者の認定及び公表について」の情報収集・検索システム

・本家経済産業省サイト  
https://www.meti.go.jp/covid-19/jizokuka_fusei_nintei.html  

# Running the system

```
sh ShellScript/00_Execute.sh
```

# You need command
- gawk
- curl
- pdftotext
- sqlite3

OS X users must install `gawk` first. The easiest way to do this is to use [Homebrew](http://brew.sh/). Once it has been installed, run the following commands:
```
brew update
brew install gawk
```

NetBSD users require `gawk`. The easiest way to do it is install it with [pkgin](http://pkgin.net):
```
pkgin install gawk
```

Alternatively install from sources using the [pkgsrc framework](https://pkgsrc.org/):
```
cd /usr/pkgsrc/lang/gawk && make install
```


OpenBSD users require `gawk`. The easiest way to do it is install it with [pkg_add](http://man.openbsd.org/OpenBSD-current/man1/pkg_add.1):
```
pkg_add gawk
```

Alternatively install from sources using the [OpenBSD ports](http://man.openbsd.org/OpenBSD-current/man1/ports.7):
```
cd /usr/ports/lang/gawk && make install clean
```

