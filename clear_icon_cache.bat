@echo off
chcp 65001 > nul
echo.
echo ==========================================================
echo  Windows 아이콘 캐시 초기화 스크립트
echo ==========================================================
echo.
echo  이 스크립트는 잠시 탐색기(explorer.exe)를 종료한 후,
echo  아이콘 캐시 데이터베이스를 삭제하고 탐색기를 재시작합니다.
echo.
pause

echo.
echo [1/3] 탐색기(explorer.exe) 프로세스를 종료합니다...
taskkill /f /im explorer.exe

echo.
echo [2/3] 아이콘 캐시 데이터베이스를 삭제합니다...
cd /d %userprofile%\AppData\Local
attrib -h IconCache.db > nul 2>&1
del IconCache.db /f /q > nul 2>&1

echo.
echo [3/3] 탐색기(explorer.exe)를 다시 시작합니다...
start explorer.exe

echo.
echo 작업이 완료되었습니다. mindDock.exe의 아이콘이 정상적으로 보이는지 확인하세요.
echo.
pause

