@echo off
chcp 65001
setlocal enabledelayedexpansion
set base=%~dp0
set pwdfile=pwd
set /A lines=0

md prgm > nul

IF EXIST main.bat (
  move main.bat prgm/ > nul
)else (
  goto :skip_move
)

IF EXIST run.js (
  move run.js prgm/ > nul
)else (
  goto :skip_move
)

:skip_move
echo %DATE% > nowdate

set /P olddate=<olddate
set /P nowdate=<nowdate

IF EXIST olddate (
  goto :if2
)else (
  echo %DATE% > olddate
  goto :run
)
:if2
if "%olddate%"=="%nowdate%" (
  type signined
  timeout /t 2 > nul
  exit
)else (
  echo %DATE% > olddate
  goto :run
)

:run

cd prgm

if exist %pwdfile% (
  rem DecodePwdFile
  certutil -f -decode pwd pwdd
  rename pwd pwd.old
  rename pwdd pwd
  goto :toif
)else (
  goto :first
)

:first
call :header
call main.bat %email% %pwd% 1
call :setuser
call main.bat %email% %pwd% 1
call :setuser
call main.bat %email% %pwd% 1
certutil -f -encode pwdd pwd
del /f pwdd
exit

:toif
rem ReadPwdFile
set /a n=0
for /f "delims=" %%a in (%base%prgm\%pwdfile%) do (
set /a n+=1 
if !n!==2 set email=%%a
)
set /a n=0
for /f "delims=" %%a in (%base%prgm\%pwdfile%) do (
set /a n+=1
if !n!==3 set pwd=%%a 
)
echo !email! %pwd%
set /a n=0
call main.bat !email! !pwd! 2

for /f "delims=" %%a in (%base%prgm\%pwdfile%) do (
set /a n+=1 
if !n!==4 set email=%%a 
)
set /a n=0
for /f "delims=" %%a in (%base%prgm\%pwdfile%) do (
set /a n+=1 
if !n!==5 set pwd=%%a 
)
echo !email! %pwd%
set /a n=0
call main.bat !email! !pwd! 2

for /f "delims=" %%a in (%base%prgm\%pwdfile%) do (
set /a n+=1 
if !n!==6 set email=%%a 
)
set /a n=0
for /f "delims=" %%a in (%base%prgm\%pwdfile%) do (
set /a n+=1 
if !n!==7 set pwd=%%a 
)
set /a n=0
echo !email! !pwd!
call main.bat !email! !pwd! 2
del /f pwd
rename pwd.old pwd
exit

:header
echo PassWord File > pwdd

:setuser
set /P email="email:"
set /P pwd="pwd:"
echo %email% >> pwdd
echo %pwd% >> pwdd

