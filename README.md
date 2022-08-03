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
- `/dev/null`を`nul`に変更
- ファイルパス内の`/`を`\\`に変更
- 文字化けする文字を変更
- iomod.F90内の`symlink`関数を`symlink.bat`を呼び出す形でWindows用に変更
- iomod.F90内の`setenv`関数はWindows用に変更できなかったため無効化

```
make
```
以下のライブラリが必要
- libgcc_s_seh-1.dll
- libgfortran-5.dll
- libgomp-1.dll

