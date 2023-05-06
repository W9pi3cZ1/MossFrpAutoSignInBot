::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcDyxMGK3A5s+1Mz+/OGTrV0hee0sa6nJyvqML/Qv+lfrf5MuwkZYjcIACCdIbBWmUgI1oGAMtGWRVw==
::fBE1pAF6MU+EWHreyHcjLQlHcDyxMGK3A5s+1Mz+/OGTrV0hee0sa6nJyvqML/Qv+lfrf5MuwkZYjcIACCdIbBWmUh0hpyBIpQQ=
::fBE1pAF6MU+EWHreyHcjLQlHcDyxMGK3A5s+1Mz+/OGTrV0hee0sa6nJyvqML/Qv+lfrf5MuwkZYjcIACCdLdxWlZwExrQ4=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCNnQA2POUWYOpEZ++Pv4Pq7j0IOR8QtaMHZ1aCyMPIc4EDnYaovw3NWnPddQhJbcXI=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZkoFGErXXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlXMaAs=
::ZQ05rAF9IAHYFVzEqQIdJwhHahaSHX6uCYYV7+bS4Yo=
::eg0/rx1wNQPfEVWB+kM9LVsJDCmNL3icFKU9/fz03OOArGQTNA==
::fBEirQZwNQPfEVWB+kM9LVsJDFHXbE3a
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWNxhPMTg2Z68moBfwO9g3DHHJIg=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCNnQA2POUWYOpEZ++Pv4Pq7j0IOR8QtaMHZ1aCyMPIc4EDnYaovw3NWnPcfDRVcfB2zUh8mrmN+lHGMO8PSthfkKg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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

