@echo off
call WPy64-310111\scripts\env.bat
if errorlevel 1 (
    goto ERROR
)

if "%~1"=="" (
    echo �뽫 whl �ļ��ϵ��˽ű���
    pause
    exit /b 1
)

echo ж��ԭ�а�...
pip uninstall -y ksaa
if errorlevel 1 (
    goto ERROR
)

echo ���ڰ�װ %~1 ...
pip install "%~1"
if errorlevel 1 (
    goto ERROR
)

echo ��װ���
pause
exit /b 0

:ERROR
echo �������󣬳����˳�
pause
exit /b 1