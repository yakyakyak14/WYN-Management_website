param(
    [Parameter(Mandatory=$true)][string]$Source,
    [string]$Dest1 = "../resources/icon.png",
    [string]$Dest2 = "../res/icon.png"
)

$ErrorActionPreference = 'Stop'

# Resolve paths relative to this script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$destPath1 = Resolve-Path -Path (Join-Path $scriptDir $Dest1) -ErrorAction SilentlyContinue
if (-not $destPath1) { $destPath1 = Join-Path $scriptDir $Dest1 }
$destPath2 = Resolve-Path -Path (Join-Path $scriptDir $Dest2) -ErrorAction SilentlyContinue
if (-not $destPath2) { $destPath2 = Join-Path $scriptDir $Dest2 }

if (!(Test-Path $Source)) { throw "Source logo not found: $Source" }

Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Image]::FromFile($Source)
try {
  $size = [Math]::Min($img.Width, $img.Height)
  $x = [int](($img.Width - $size) / 2)
  $y = [int](($img.Height - $size) / 2)

  $cropRect = New-Object System.Drawing.Rectangle($x, $y, $size, $size)
  # Create square bitmap with explicit 32bpp ARGB pixel format
  $square = New-Object System.Drawing.Bitmap($size, $size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g = [System.Drawing.Graphics]::FromImage($square)
  $g.InterpolationMode  = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.SmoothingMode      = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $g.PixelOffsetMode    = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
  $g.DrawImage($img, [System.Drawing.Rectangle]::new(0,0,$size,$size), $cropRect, [System.Drawing.GraphicsUnit]::Pixel)
  $g.Dispose()

  # Final 1024x1024 PNG with 32bpp ARGB
  $final = New-Object System.Drawing.Bitmap(1024, 1024, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g2 = [System.Drawing.Graphics]::FromImage($final)
  $g2.InterpolationMode  = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g2.SmoothingMode      = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $g2.PixelOffsetMode    = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $g2.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
  $g2.DrawImage($square, 0, 0, 1024, 1024)
  $g2.Dispose()

  $d1 = Split-Path -Parent $destPath1
  if (!(Test-Path $d1)) { New-Item -ItemType Directory -Force -Path $d1 | Out-Null }
  $final.Save($destPath1, [System.Drawing.Imaging.ImageFormat]::Png)

  $d2 = Split-Path -Parent $destPath2
  if (!(Test-Path $d2)) { New-Item -ItemType Directory -Force -Path $d2 | Out-Null }
  $final.Save($destPath2, [System.Drawing.Imaging.ImageFormat]::Png)

  $final.Dispose()
  $square.Dispose()

  Write-Host "Icon generated at: $destPath1"
  Write-Host "Icon generated at: $destPath2"
}
finally {
  $img.Dispose()
}
