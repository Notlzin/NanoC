param (
    [string]$Output = ".\a.nexe",
    [string[]]$Inputs
)

function Write-Step($msg, $color = "Gray") {
    Write-Host "[*] $msg" -ForegroundColor $color
}

function Safe-ReadFile($path) {
    if (Test-Path $path) {
        return Get-Content -Raw -Path $path
    } else {
        throw "Input file not found: $path"
    }
}

Write-Step "NanoLinker (toy) starting..." Green
Write-Step "Output file: $Output" Cyan
Write-Step ("Input files: {0}" -f ($Inputs -join ", ")) Cyan

$nanotext = ""
$nanodata = ""

# Phase 1: Collect sections
Write-Step "Phase 1: collecting input sections" Green
foreach ($infile in $Inputs) {
    $content = Safe-ReadFile $infile

    if ($content -match "\.nanodata") {
        $nanodata += "`n; from $($infile)`n$content"
    } else {
        $nanotext += "`n; from $($infile)`n$content"
    }
}

Write-Host ""

# Phase 2: Compute sizes
$nanoTextBytes = [int]([Text.Encoding]::UTF8.GetByteCount($nanotext))
$nanoDataBytes = [int]([Text.Encoding]::UTF8.GetByteCount($nanodata))

$nanoTextBase = 0x00001000
$nanoDataBase = $nanoTextBase + $nanoTextBytes

Write-Step "Phase 2: computing layout & offsets (toy)" Green
Write-Step ("  -> .nanotext size: {0} bytes @ 0x{1:X8}" -f $nanoTextBytes, $nanoTextBase) Cyan
Write-Step ("  -> .nanodata size: {0} bytes @ 0x{1:X8}" -f $nanoDataBytes, $nanoDataBase) Cyan

# Phase 3: Build payload
Write-Step "Phase 3: emitting final payload" Green
$payload = @()

if ($nanotext) {
    $payload += '--- .nanotext ---'
    $payload += $nanotext
} else {
    $payload += "; (no nanotext)"
}

$payload += '--- .nanodata ---'

if ($nanodata) {
    $payload += $nanodata
} else {
    $payload += "; (no nanodata)"
}

$payload += '--- SYMBOLS ---'
$payload += "SYMBOLS: none (toy)"

# Write output file
$payloadText = $payload -join "`n"
Set-Content -Path $Output -Value $payloadText -Encoding UTF8

Write-Step "Link complete: $Output" Green
