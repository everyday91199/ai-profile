@echo off
chcp 65001 >nul
title 万老师的个人 AI 档案 - 换一台电脑 / 换一个 AI 时用这个
cd /d "%~dp0.."

:MENU
cls
echo ============================================================
echo    万老师的个人 AI 档案
echo ============================================================
echo.
echo    1. 打开 START-HERE.md      （全选复制，粘给任何 AI）
echo    2. 重新生成 START-HERE.md  （改完 profile/ 之后跑）
echo    3. 打开仓库文件夹
echo    4. 查看四种 AI 的加载方式
echo    0. 退出
echo.
set /p CHOICE=请输入数字后回车: 

if "%CHOICE%"=="1" goto OPEN
if "%CHOICE%"=="2" goto BUILD
if "%CHOICE%"=="3" goto FOLDER
if "%CHOICE%"=="4" goto HOWTO
if "%CHOICE%"=="0" goto END
goto MENU

:OPEN
if exist "START-HERE.md" (
  echo.
  echo  已打开 START-HERE.md
  echo  按 Ctrl+A 全选、Ctrl+C 复制，然后粘贴进 AI 对话框
  echo.
  start notepad.exe "START-HERE.md"
) else (
  echo  没找到 START-HERE.md，请先选 2 重新生成。
  pause
)
goto MENU

:BUILD
echo.
echo  正在重新生成 START-HERE.md ...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "scripts\build-start-here.ps1"
echo.
pause
goto MENU

:FOLDER
start explorer.exe "%CD%"
goto MENU

:HOWTO
cls
echo ============================================================
echo    四种 AI 的加载方式
echo ============================================================
echo.
echo  [1] Codex / Claude Code / Cursor（能读本地文件）
echo      先读 AGENTS.md，再读 profile/ 全部 + memory/ 最近一期，然后才开始干活。
echo.
echo  [2] Kimi / 豆包 / DeepSeek（读不了文件）
echo      把 START-HERE.md 的 raw 链接发给他：
echo      https://raw.githubusercontent.com/everyday91199/ai-profile/main/START-HERE.md
echo      读不了就走 [3] 复制粘贴保底。
echo.
echo  [3] 复制粘贴保底（任何 AI 都行，零依赖）
echo      打开 START-HERE.md - Ctrl+A 全选 - 复制 - 粘贴进对话框。
echo.
echo  [4] 手机端
echo      手机上打开同一个 raw 链接，长按全选复制，粘贴进 AI App。
echo.
echo ============================================================
pause
goto MENU

:END
exit
