@echo off
REM ========================================================
REM Portable YouTube to MP3 Downloader (Clean Version)
REM - Requires yt-dlp.exe and ffmpeg.exe in bin\
REM - Prompts for YouTube URL
REM - Converts to MP3 (VBR 0), stores in downloads\
REM - Skips existing downloads, tracks via archive.txt
REM ========================================================

setlocal ENABLEDELAYEDEXPANSION

REM Check for yt-dlp
if not exist "bin\yt-dlp.exe" (
  echo [ERROR] yt-dlp.exe not found in bin\
  pause
  exit /b 1
)

REM Check for ffmpeg
if not exist "bin\ffmpeg.exe" (
  echo [ERROR] ffmpeg.exe not found in bin\
  pause
  exit /b 1
)

REM Create downloads folder if missing
if not exist "downloads" (
  mkdir downloads
)

echo.
set /p URL=Paste YouTube video or playlist URL: 
if "%URL%"=="" (
  echo [ERROR] No URL provided.
  pause
  exit /b 1
)

REM Uncomment ONE of the following lines if you need cookies for login/age restrictions:
REM set COOKIES=--cookies-from-browser firefox
REM set COOKIES=--cookies-from-browser edge

echo [INFO] Downloading and converting to MP3...
bin\yt-dlp.exe ^
  --no-overwrites ^
  --extract-audio ^
  --audio-format mp3 ^
  --audio-quality 0 ^
  --yes-playlist ^
  --ignore-errors ^
  --download-archive archive.txt ^
  --ffmpeg-location "bin" ^
  --output "downloads/%%(title)s.%%(ext)s" ^
  %COOKIES% ^
  "%URL%"

echo.
echo [DONE] Files saved in the 'downloads' folder.
pause
endlocal
