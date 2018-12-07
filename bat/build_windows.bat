@ECHO OFF

CLS

CD..

ECHO Building OpenFL on "Windows". . .

HAXELIB run openfl build windows

ECHO Testing OpenFL on "Windows". . .

HAXELIB run openfl test windows

ECHO.

PAUSE

CLS

EXIT 