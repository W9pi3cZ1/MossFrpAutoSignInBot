@echo off
title auto mosaic
set email=%1
set password=%2
set /a exittime=%3
curl -X GET https://https.ghs.wiki:7002/API?type=login^&loginType=email^&account=%email%^&password=%password%  > req
type req
echo ^^ >> con 
node run.js > run.bat
echo type req2 >> run.bat
echo echo  ^^^^ ^>^> con >> run.bat
echo timeout /t %exittime% ^> nul >> run.bat
call run.bat