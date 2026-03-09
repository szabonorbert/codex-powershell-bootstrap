# codex-powershell-bootstrap

PowerShell script that boots a ready-to-use Codex development workspace
in Windows Terminal.

It opens a preconfigured multi-pane layout so you can work with Codex
and your project simultaneously.

Typical layout:

-   Codex console
-   Second Codex console
-   Utility shell
-   Project dev server (`npm run dev`)

This allows you to keep AI interaction, development server, and shell
tools visible at the same time.

## Usage

Copy the ```dev.ps1``` file to your repository and run:

``` powershell
.\dev.ps1
```

This will launch a new Windows Terminal window with the predefined
workspace layout. Feel free to modify the script to adjust pane sizes, commands, or add
additional tools.

## Codex on Windows (UTF-8 fix)

If you use Codex on Windows, I recommend you to force UTF‑8 encoding
in PowerShell. This prevents issues with accented characters and improves reliability
when working with non‑ASCII text.

### Install PowerShell 7

``` powershell
winget install --id Microsoft.PowerShell --source winget
```

Then set PowerShell 7 as your default terminal shell.

### Update your PowerShell profile

Open your profile file:

``` powershell
notepad $PROFILE
```

Add the following block:

``` powershell
try { & "$env:windir\System32\chcp.com" 65001 > $null } catch {}
try { [Console]::InputEncoding  = [System.Text.Encoding]::UTF8 } catch {}
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
try { $global:OutputEncoding    = [System.Text.Encoding]::UTF8 } catch {}
```

After this, Codex will display UTF‑8 text more reliably.

## Notes

### Windows Terminal fullscreen

It would be convenient to launch Windows Terminal directly in fullscreen
using:

    wt -M

However, in this setup the Windows Terminal pane manager becomes
**non‑deterministic** when `-M` is used. Under Windows 11 I experienced inconsistent pane behavior and layout errors when the workspace was created in maximized mode.

For this reason the fullscreen launch option was intentionally **not
used**.

⚠ NOTE: `wt -M` (maximize) is unreliable in this setup.

## License

MIT
