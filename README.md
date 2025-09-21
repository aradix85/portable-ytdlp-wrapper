# Portable YT-DLP Wrapper

## Project summary
A portable Windows batch script to download YouTube videos or playlists as MP3 audio.  
Requires **yt-dlp.exe** and **ffmpeg.exe** (place them in `/bin`). NVDA-friendly and simple to use.
          
# Portable YouTube Audio Downloader (yt-dlp + ffmpeg)

## What this project **is**
A small, NVDA‑friendly Windows batch wrapper around [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ffmpeg](https://ffmpeg.org/).
- Paste a YouTube video or playlist URL.
- Converts audio to **MP3 (VBR 0)** by default.
- Downloads are stored in the local `downloads/` folder.
- Robust behavior: skips already downloaded items (`archive.txt`), continues partial downloads, ignores per‑item errors.

## What this project **is not**
- ❌ It does **not** include `yt-dlp.exe` or `ffmpeg.exe`.
- ❌ It does **not** auto‑update or provide support.
- ❌ It does **not** bypass copyright law or YouTube’s Terms of Service.

## Directory layout
```
project-root\
│  download.bat
│  README_portable_yt.md
│  LICENSE_GPLv3.txt
│  archive.txt            (created on first run)
│
├─bin\                   (put tools here, see README_bin.txt)
│    yt-dlp.exe
│    ffmpeg.exe
│    README_bin.txt
│
└─downloads\             (created automatically on first run)
     <your files>.mp3
```
project-root\
│  download.bat
│  README_portable_yt.md
│  LICENSE_GPLv3.txt
│  archive.txt            (created on first run)
│
├─bin\                   (put tools here)
│    yt-dlp.exe
│    ffmpeg.exe
│
└─downloads\             (created automatically on first run)
     <your files>.mp3
```

## Requirements
1. **yt-dlp.exe** (Windows release) – place in `bin\`
2. **ffmpeg.exe** – place in `bin\`

## Quick start
1. Put `yt-dlp.exe` and `ffmpeg.exe` in `bin\`.
2. Double‑click `download.bat`.
3. Paste a YouTube **video** or **playlist** URL when prompted.
4. The script downloads the best available audio and converts it to MP3 (VBR 0).
5. Files appear in `downloads\`. Existing files are **not overwritten**.

## Optional: enable cookies for age/login/region walls
Sometimes YouTube requires proof you’re logged in or of age. `yt-dlp` can reuse your browser session cookies so it behaves like your logged‑in browser. This can help with:
- Age‑restricted videos (18+ wall)
- Login‑only or membership content you’re allowed to access
- Some region‑locked cases (when access works in your browser)

### How to enable (Firefox or Edge)
By default, cookies are **off** to keep the tool fully portable. If you hit a wall, edit `download.bat` and **uncomment ONE** of the lines below by removing the leading `REM`:

```bat
REM Uncomment ONE of the following lines if you need cookies for login/age restrictions:
REM set COOKIES=--cookies-from-browser firefox
REM set COOKIES=--cookies-from-browser edge
```

Leave the other line commented. Save the file and run it again.

**Notes**
- You must be **logged in** in the chosen browser, and that browser should have access to the video.
- Keep only **one** `set COOKIES=...` active at a time.
- If you later want full portability again, re‑add `REM` to disable cookies.

## Troubleshooting
- **“yt-dlp.exe not found in bin\”** → put `yt-dlp.exe` in the `bin\` folder.
- **“ffmpeg.exe not found in bin\”** → put `ffmpeg.exe` in the `bin\` folder.
- **Already downloaded?** The script uses `archive.txt` and `--no-overwrites`, so it will **skip** files you already have.
- **Playlist vs single**: You can paste either; playlists are handled automatically.
- **Age/login wall**: Enable cookies as described above.

## License
This project is released under the **GNU GPLv3** by aradix86.  
Full text is included in `LICENSE_GPLv3.txt` and online at: <https://www.gnu.org/licenses/gpl-3.0.html>

## Credits
- Wrapper and project: **aradix86 (Anouk)**
- Batch logic & documentation support: **ChatGPT (OpenAI)**
