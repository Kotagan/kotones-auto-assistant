@echo off
call WPy64-310111\scripts\env.bat
if errorlevel 1 (
    goto ERROR
)

if "%~1"=="" (
    echo �뽫 Python ���ļ��ϵ��˽ű���
    pause
    exit /b 1
)

echo =========== ж��ԭ�а� ===========
pip uninstall -y ksaa
pip uninstall -y ksaa_res
if errorlevel 1 (
    goto ERROR
)

:INSTALL_LOOP
if "%~1"=="" goto INSTALL_DONE

echo =========== ��װ %~1 ===========
pip install "%~1"
if errorlevel 1 (
    goto ERROR
)

shift
goto INSTALL_LOOP

:INSTALL_DONE
echo =========== ��װ��� ===========
pause
exit /b 0

:ERROR
echo �������󣬳����˳�
pause
exit /b 1