@echo off
Setlocal EnableDelayedExpansion 

pushd %~dp0
if not exist build goto :build

set retry=10

:retry
set /A retry=!retry!-1
if "!retry!"=="0" goto :nodelete
if not exist build goto :build
rd /s /q build 
if exist build external\sleep 2 
goto :retry


:build
call build.cmd

goto :eof

:nodelete
echo Error deleting 'build' folder, is it locked?
goto :eof