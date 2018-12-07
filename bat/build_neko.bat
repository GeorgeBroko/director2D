@ECHO OFF

CLS

CD..

ECHO Building OpenFL on "Neko". . .

HAXELIB run openfl build neko -debug

ECHO Testing OpenFL on "Neko". . .

HAXELIB run openfl test neko -debug

ECHO.

PAUSE

CLS

EXIT 