@echo off
setlocal
set old1=%1%
set old2=%old1:./=%
set old3=%old2:/=\%
set new1=%2%
set new2=%new1:./=%
set new3=%new2:/=\%
for %%i in (%old3%) do set attr=%%~ai

if exist %1 (
    if %attr:~0,1%==d (
        mklink /j %2 %1
    ) else if %attr:~0,1%==- (
        mklink /h %2 %1
    )
) else (
    echo %1‚ª‘¶İ‚µ‚Ü‚¹‚ñB
)
