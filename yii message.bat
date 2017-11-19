@echo off

rem -------------------------------------------------------------
rem  Yii command line configured message script for Windows.
rem
rem  @author RUben Begalov <begalov@gmail.com>
rem -------------------------------------------------------------

@setlocal

set YII_PATH=%~dp0

if "%PHP_COMMAND%" == "" set PHP_COMMAND=php.exe

"%PHP_COMMAND%" "%YII_PATH%yii" message config.php %*

@endlocal
