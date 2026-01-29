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
