$port = 8080
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "KICKZ Dev Server running at http://localhost:$port/"
Write-Host "Press Ctrl+C to stop."

$workspace = "C:\Users\Kye\Desktop\06211"

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $urlPath = $request.Url.LocalPath
        if ($urlPath -eq "/") {
            $urlPath = "/index.html"
        }
        
        // Clean url path and construct absolute file path
        $cleanPath = $urlPath.Replace("/", "\").TrimStart('\')
        $filePath = Join-Path $workspace $cleanPath
        
        if (Test-Path $filePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            
            // Set Content-Type
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = "text/plain"
            switch ($ext) {
                ".html" { $contentType = "text/html; charset=utf-8" }
                ".css" { $contentType = "text/css; charset=utf-8" }
                ".js" { $contentType = "application/javascript; charset=utf-8" }
                ".svg" { $contentType = "image/svg+xml; charset=utf-8" }
                ".png" { $contentType = "image/png" }
                ".jpg" { $contentType = "image/jpeg" }
                ".ico" { $contentType = "image/x-icon" }
            }
            
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $notFoundMsg = [System.Text.Encoding]::UTF8.GetBytes("404 File Not Found: $urlPath")
            $response.ContentType = "text/plain; charset=utf-8"
            $response.ContentLength64 = $notFoundMsg.Length
            $response.OutputStream.Write($notFoundMsg, 0, $notFoundMsg.Length)
        }
        
        $response.OutputStream.Close()
    }
} catch {
    Write-Host "Server error: $_"
} finally {
    $listener.Stop()
    Write-Host "Server stopped."
}
