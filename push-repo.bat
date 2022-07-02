@echo off
@title bat execute git auto commit
C:
cd C:/flutterdev/care_republic
git add .
@REM  HEAD
git commit -m "beauty care app eddies branch"
git push -f origin_edd main
@REM =======
@REM git commit -m "beauty care app eddies collaboration"
@REM git push -u origin master
@REM  4e05437ff7705d47abf6d15eff059be09f9a48a2
