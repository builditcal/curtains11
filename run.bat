@echo off
Set-ExecutionPolicy Unrestricted -Scope Process -Force
powershell -NoProfile -ExecutionPolicy Bypass ./start.ps1
Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force
