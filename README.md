<p align="center">
    <a href="https://opensource.org/licenses/BSD-3-Clause"><img src="https://img.shields.io/badge/license-bsd-orange.svg" alt="Licenses"></a>
</p>

# Liste_des_certificats_de_beneficiaires_frauduleux_des_avantages_durables
「持続化給付金の不正受給者の認定及び公表について」の情報収集・検索システム  
検索画面はgolangのWailsで作成する予定・・・。  
データを蓄積する形式で、経産省から当該データに更新が入っても消えないのが特徴。  

Système de collecte / recherche d'informations pour "certification et publication de bénéficiaires frauduleux d'avantages durables"  
L'écran de recherche sera créé avec Golang's Wails ...  
C'est un format d'accumulation de données, et il se caractérise par ne pas disparaître même si les données sont mises à jour par le ministère de l'Économie, du Commerce et de l'Industrie.  

・本家経済産業省サイト（持続化給付金の不正受給者の認定及び公表について）  
https://www.meti.go.jp/covid-19/jizokuka_fusei_nintei.html  

・本家経済産業省サイト（家賃支援給付金の不正受給者の認定及び公表について）  
https://www.meti.go.jp/covid-19/yachin-kyufu/fusei_nintei.html    

# Journal des modifications

2022/06/27 「家賃支援給付金の不正受給者の認定及び公表について」のデータも収集するように収集機能を追加  

# Download

https://github.com/GinSanaduki/Liste_des_certificats_de_beneficiaires_frauduleux_des_avantages_durables/releases/download/V1.0.0.0/Liste_des_certificats_de_beneficiaires_frauduleux_des_avantages_durables.7z  


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

# Licenses
This program is under the terms of the BSD 3-Clause License.  
See https://opensource.org/licenses/BSD-3-Clause.  
