# CLAUDE_CONFIG_DIR overrides ~/.claude, matching where the hooks write the flag (issue #34)
#
# LOCAL PATCH -- diverges from upstream DietrichGebert/ponytail. See README.
# A repo running ponytail as project hooks keeps its mode flag inside the repo
# (.claude/.ponytail/active), so prefer that, using the project directory Claude
# Code passes as JSON on stdin. Falls back to the user-level flag when there is
# no stdin, no project_dir, or no repo-local flag, so a user-level install is
# unaffected.
$ClaudeDir = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME ".claude" }
$Flag = Join-Path $ClaudeDir ".ponytail-active"

try {
    $Input = [Console]::In.ReadToEnd()
    if ($Input) {
        $Match = [regex]::Match($Input, '"project_dir"\s*:\s*"((?:[^"\\]|\\.)*)"')
        if ($Match.Success) {
            $ProjectDir = $Match.Groups[1].Value -replace '\\\\', '\'
            $ProjectFlag = Join-Path $ProjectDir ".claude/.ponytail/active"
            if (Test-Path $ProjectFlag) { $Flag = $ProjectFlag }
        }
    }
} catch { }

if (-not (Test-Path $Flag)) {
    exit 0
}

$Mode = ""
try {
    $Mode = (Get-Content $Flag -ErrorAction Stop | Select-Object -First 1).Trim()
} catch {
    exit 0
}

$Esc = [char]27
# ultra is the high-intensity mode; flag it amber so it stands out from the
# default green. The level is still in the text, so color is a redundant cue.
$Color = if ($Mode -eq "ultra") { "173" } else { "108" }
if ([string]::IsNullOrEmpty($Mode) -or $Mode -eq "full") {
    [Console]::Write("${Esc}[38;5;${Color}m[PONYTAIL]${Esc}[0m")
} else {
    $Suffix = $Mode.ToUpperInvariant()
    [Console]::Write("${Esc}[38;5;${Color}m[PONYTAIL:$Suffix]${Esc}[0m")
}
