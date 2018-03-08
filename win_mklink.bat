cd /d %~dp0

del %HOMEPATH%\.vimrc
rmdir %HOMEPATH%\.vim
del %HOMEPATH%\.screenrc

mklink %HOMEPATH%\.vimrc %~dp0\.vimrc
mklink /D %HOMEPATH%\.vim %~dp0\.vim
mklink %HOMEPATH%\.screenrc %~dp0\.screenrc

