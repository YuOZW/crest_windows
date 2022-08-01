## Cygwin
以下のライブラリが必要
- git
- make
- mingw64-x86_64-gcc-core
- mingw64-x86_64-gcc-fortran

## OpenBLAS
https://github.com/xianyi/OpenBLAS
```
make CC=x86_64-w64-mingw32-gcc FC=x86_64-w64-mingw32-gfortran
mkdir ~/bin/OpenBLAS-0.3.17
make PREFIX=~/bin/OpenBLAS-0.3.17 install
```

## crest
src/Makefileを編集する。`(username)`を設定。

```
cd src
make
```
以下のライブラリが必要
- libgcc_s_seh-1.dll
- libgfortran-5.dll
- libgomp-1.dll

