@echo off
title CareerTrack Web App
echo Starting CareerTrack local web server...
powershell -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
