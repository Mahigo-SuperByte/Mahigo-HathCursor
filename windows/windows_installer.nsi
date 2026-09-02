Name "HathCursor"
OutFile "HathCursor-Installer.exe"
InstallDir "$PROFILE\AppData\Local\HathCursor"
RequestExecutionLevel user

Page Directory
Page InstallsFiles

Section "Install"
    SetOutPath $INSTDIR
    File "source_pngs/left_ptr.png"
    File "source_pngs/hand1.png"
    File "source_pngs/openhand.png"
    File "source_pngs/grabbing.png"
    
    ; Write keys to Windows Registry so the OS recognizes the theme
    WriteRegStr HKCU "Control Panel\Cursors\Schemes" "HathCursor" "$INSTDIR\left_ptr.png,,$INSTDIR\hand1.png,,$INSTDIR\hand1.png,,,,,,,,$INSTDIR\openhand.png,,$INSTDIR\grabbing.png"
SectionEnd
