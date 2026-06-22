$port = 8080
$listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Loopback, $port)
$listener.Start()
Write-Host "KICKZ TCP Web Server running on http://localhost:$port/"
Write-Host "Press Ctrl+C to stop."

$workspace = "C:\Users\Kye\Desktop\06211"

try {
    while ($true) {
        $client = $listener.AcceptTcpClient()
        $stream = $client.GetStream()
        
        $buffer = New-Object System.Byte[] 2048
        $readBytes = $stream.Read($buffer, 0, $buffer.Length)
        if ($readBytes -le 0) {
            $stream.Close()
            $client.Close()
            continue
        }
        
        $requestText = [System.Text.Encoding]::UTF8.GetString($buffer, 0, $readBytes)
        
        if ($requestText -match "GET (\S+) HTTP") {
            $urlPath = $Matches[1]
            if ($urlPath -eq "/") {
                $urlPath = "/index.html"
            }
            
            // Clean url path and construct absolute file path
            $cleanPath = $urlPath.Replace("/", "\").TrimStart('\')
            
            // Strip query string if exists (like ?id=1)
            if ($cleanPath -match "^([^\?]+)\?") {
                $cleanPath = $Matches[1]
            }
            
            $filePath = Join-Path $workspace $cleanPath
            
            if (Test-Path $filePath -PathType Leaf) {
                $fileBytes = [System.IO.File]::ReadAllBytes($filePath)
                
                // Content-Type
                $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
                $contentType = "text/plain"
                switch ($ext) {
                    ".html" { $contentType = "text/html; charset=utf-8" }
                    ".css" { $contentType = "text/css; charset=utf-8" }
                    ".js" { $contentType = "application/javascript; charset=utf-8" }
                    ".svg" { $contentType = "image/svg+xml; charset=utf-8" }
                    ".png" { $contentType = "image/png" }
                }
                
                $header = "HTTP/1.1 200 OK`r`nContent-Type: $contentType`r`nContent-Length: $($fileBytes.Length)`r`nConnection: close`r`n`r`n"
                $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
                
                $stream.Write($headerBytes, 0, $headerBytes.Length)
                $stream.Write($fileBytes, 0, $fileBytes.Length)
            } else {
                $notFoundMsg = [System.Text.Encoding]::UTF8.GetBytes("404 File Not Found: $urlPath")
                $header = "HTTP/1.1 404 Not Found`r`nContent-Type: text/plain; charset=utf-8`r`nContent-Length: $($notFoundMsg.Length)`r`nConnection: close`r`n`r`n"
                $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
                
                $stream.Write($headerBytes, 0, $headerBytes.Length)
                $stream.Write($notFoundMsg, 0, $notFoundMsg.Length)
            }
        }
        
        $stream.Close()
        $client.Close()
    }
} catch {
    Write-Host "Server encountered an error: $_"
} finally {
    $listener.Stop()
    Write-Host "Server stopped."
}
