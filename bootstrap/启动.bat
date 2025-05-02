@echo off
call WPy64-310111\scripts\env.bat
if errorlevel 1 (
    goto ERROR
)
set PIP_EXTRA_INDEX_URL=https://mirrors.cloud.tencent.com/pypi/simple/ http://mirrors.aliyun.com/pypi/simple/

echo =========== ��װ����� KAA ===========
:INSTALL
echo ��� pip
python -m pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple --upgrade pip
if errorlevel 1 (
    goto ERROR
)
pip config set global.trusted-host "pypi.org files.pythonhosted.org pypi.python.org mirrors.aliyun.com mirrors.cloud.tencent.com mirrors.tuna.tsinghua.edu.cn"
pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
echo ��װ ksaa
pip install --upgrade ksaa
if errorlevel 1 (
    goto ERROR
)

echo =========== ��ǰ�汾 ===========
pip show ksaa

echo =========== ���� KAA ===========
:RUN
set no_proxy=localhost, 127.0.0.1, ::1
kaa
if errorlevel 1 (
    goto ERROR
)

echo =========== ���н��� ===========
pause
exit /b 0

:ERROR
echo �������󣬳����˳�
pause
exit /b 1