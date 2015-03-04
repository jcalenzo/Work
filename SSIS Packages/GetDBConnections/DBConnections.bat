For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
For /f "tokens=* delims= " %%a in ("%mytime%") do set mytime=%%a
set _my_datetime=%mydate%_%mytime%
set "customerFolder=GetDBConnections\" REM Update
set "packageDirectory=C:\Program Files\Microsoft SQL Server\MSSQL11.MYSERVER\MSSQL\SSIS Packages\"

set "dtsxPackage=%packageDirectory%%customerFolder%DBConnections.dtsx" REM Update
set dtexecLocation="C:\Program Files\Microsoft SQL Server\110\DTS\Binn\dtexec.exe"
set "tasklogLocation=%packageDirectory%%customerFolder%\TaskLogs\%fileName%_TaskLog_%_my_datetime%.txt"

%dtexecLocation% /f "%dtsxPackage%" > "%tasklogLocation%"