# CareerTrack - Bulletproof Local Web Server
# Powered by Windows PowerShell HttpListener

$Port = 3000
$Folder = $PSScriptRoot

$Listener = New-Object System.Net.HttpListener
$Listener.Prefixes.Add("http://localhost:$Port/")
$Listener.Prefixes.Add("http://127.0.0.1:$Port/")

try {
    $Listener.Start()
} catch {
    # If 3000 is occupied or restricted, fallback to 8080
    $Port = 8080
    $Listener = New-Object System.Net.HttpListener
    $Listener.Prefixes.Add("http://localhost:$Port/")
    $Listener.Prefixes.Add("http://127.0.0.1:$Port/")
    $Listener.Start()
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   🚀 CareerTrack is running on:" -ForegroundColor Green
Write-Host "   -> http://localhost:$Port/" -ForegroundColor Yellow
Write-Host "   -> http://127.0.0.1:$Port/" -ForegroundColor Yellow
Write-Host "   Folder: $Folder" -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

while ($Listener.IsListening) {
    try {
        $Context = $Listener.GetContext()
        $Request = $Context.Request
        $Response = $Context.Response

        $UrlPath = $Request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($UrlPath)) {
            $UrlPath = "index.html"
        }

        # Strip query parameters if present
        if ($UrlPath.Contains('?')) {
            $UrlPath = $UrlPath.Substring(0, $UrlPath.IndexOf('?'))
        }

        $FilePath = Join-Path $Folder $UrlPath

        if (Test-Path $FilePath -PathType Leaf) {
            $Ext = [System.IO.Path]::GetExtension($FilePath).ToLower()
            $ContentType = switch ($Ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".json" { "application/json; charset=utf-8" }
                ".svg"  { "image/svg+xml" }
                ".png"  { "image/png" }
                ".ico"  { "image/x-icon" }
                Default { "application/octet-stream" }
            }

            $Bytes = [System.IO.File]::ReadAllBytes($FilePath)
            $Response.ContentType = $ContentType
            $Response.AddHeader("Access-Control-Allow-Origin", "*")
            $Response.AddHeader("Cache-Control", "no-cache")
            $Response.OutputStream.Write($Bytes, 0, $Bytes.Length)
            $Response.Close()
        } else {
            $Response.StatusCode = 404
            $ErrBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $UrlPath")
            $Response.ContentType = "text/plain; charset=utf-8"
            $Response.OutputStream.Write($ErrBytes, 0, $ErrBytes.Length)
            $Response.Close()
        }
    } catch {
        # Log error and keep server running without interruption
        Write-Warning "Request error: $($_.Exception.Message)"
        try { $Response.Close() } catch {}
    }
}
