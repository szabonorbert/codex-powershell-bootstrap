# NOTE: wt -M (maximize) is unreliable in this setup.
# Norbert Szabo — 2026-03-06 23:03

$dir = (Get-Location).Path
wt -w new `
        new-tab `
            -d $dir pwsh -NoExit `
            -Command "codex" `
        ';' `
        split-pane -V `
            -d $dir pwsh -NoExit `
            -Command "codex" `
        ';' `
        split-pane -H `
            -d $dir --size 0.25 pwsh -NoExit `
        ';' `
        move-focus first `
        ';' `
        split-pane -H `
            -d $dir --size 0.25 pwsh -NoExit `
            -Command "npm run dev" `
        ';' `
        move-focus first