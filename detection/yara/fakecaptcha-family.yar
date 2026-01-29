rule FakeCAPTCHA_Family_2026 {
    meta:
        description = "Fake CAPTCHA Amatera Stealer variants"
        date = "2026-01-29"
    
    strings:
        $s1 = "SyncAppvPublishingServer.vbs" ascii wide
        $s2 = "new-alias iex" wide ascii nocase
        $s3 = /herf54|nim5|sample\.bin/i
        $png1 = "q0A5@z" ascii wide
        $png2 = "hcUdFm" ascii wide
        $png3 = "Ja1DUq" ascii wide
        $xor_key = "s8YUKQ0CqUd6HNwGSRDZ%Qpux1N9MKHh"
        
    condition:
        $s1 and ($s2 or $s3 or $xor_key) or (2 of ($png*))
}
