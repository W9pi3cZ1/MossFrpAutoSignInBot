@echo off
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
  echo 已签到
  timeout /t 5
  exit
)else (
  echo %DATE% > olddate
  goto :run
)

:run

if exist %file% (
  set lines=lines+1
	for /f "skip=%lines% delims=" %%a in (%base%%pwdfile%) do (set email=%%a)
  set lines=lines+1
  for /f "skip=%lines% delims=" %%a in (%base%%pwdfile%) do (set pwd=%%a)
  call main.bat %email% %pwd% 2
  
  set lines=lines+1
	for /f "skip=%lines% delims=" %%a in (%base%%pwdfile%) do (set email=%%a)
  set lines=lines+1
  for /f "skip=%lines% delims=" %%a in (%base%%pwdfile%) do (set pwd=%%a)
  call main.bat %email% %pwd% 2
)

cd prgm

call :setuser
call main.bat %email% %pwd% 2
call :setuser
call main.bat %email% %pwd% 2
exit

:setuser
echo PassWord File > pwd
set /P email="email:"
set /P pwd="pwd:"
echo %email% >> pwd
echo %password% >> pwd

