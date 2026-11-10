# Script: tong_hop.ps1
# Tac gia: Sinh vien
# Ngay tao: 10/11/2026
Write-Host "Dang tao bao cao..."
"=== BAO CAO SU CO WEBSITE ===" | Set-Content "logs/tong_hop.txt"
Get-Content "logs/access.log" | Select-String "status=404" | ForEach-Object { $_.Line } | Add-Content "logs/tong_hop.txt"
(Get-Content "logs/access.log" | Select-String "status=500" | Measure-Object).Count | Add-Content "logs/tong_hop.txt"
Write-Host "Hoan thanh!"
