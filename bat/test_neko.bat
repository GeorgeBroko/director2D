@ECHO OFF

CLS

CD..

ECHO Testing OpenFL on "Neko". . .

HAXELIB run openfl test neko -debug

ECHO.

PAUSE

CLS

EXIT 