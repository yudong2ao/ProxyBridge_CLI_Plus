@echo off

:: 1. 管理员权限检查与自动提权
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
cd /d "%~dp0"

:: 2. 动态获取当前绝对路径
set "CURR_DIR=%~dp0"
if "%CURR_DIR:~-1%"=="\" set "CURR_DIR=%CURR_DIR:~0,-1%"

set "TASK_NAME=ProxyBridge_Silent_Autostart"
set "EXE_PATH=%CURR_DIR%\ProxyBridge_CLI.exe"
set "PROFILE_PATH=%CURR_DIR%\Default.pbprofile"

echo ---------------------------------------------------
echo 正在自动注册【ProxyBridge】后台自启服务...
echo ---------------------------------------------------

:: 3. 注册计划任务（SYSTEM 权限 + Session 0 静默运行 + 优化常驻配置）
powershell -Command "$action = New-ScheduledTaskAction -Execute '%EXE_PATH%' -Argument '--profile \"%PROFILE_PATH%\"' -WorkingDirectory '%CURR_DIR%'; $trigger = New-ScheduledTaskTrigger -AtLogOn; $principal = New-ScheduledTaskPrincipal -UserId 'SYSTEM' -LogonType ServiceAccount -RunLevel Highest; $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Days 0) -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1) -StartWhenAvailable; Register-ScheduledTask -TaskName '%TASK_NAME%' -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force" >nul

echo.
echo ===================================================
echo [成功] ProxyBridge 自启动服务配置完成！
echo.
echo 核心优化特性：
echo - [运行模式] SYSTEM 账户 (Session 0 静默后台，无弹窗)
echo - [常驻保障] 已取消 3 天运行超时限制 (永不被系统强杀)
echo - [崩溃自愈] 异常退出后 1 分钟自动重试拉起 (最多 3 次)
echo - [电源策略] 支持笔记本电池供电持续运行
echo - [工作目录] %CURR_DIR%
echo ===================================================
echo.
pause
