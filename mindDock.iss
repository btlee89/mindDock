[Setup]
AppName=MindDock
AppVersion=1.1.1
DefaultDirName={pf}\MindDock
DefaultGroupName=MindDock
OutputDir=output
OutputBaseFilename=MindDockSetup
SetupIconFile=mindDock.ico
PrivilegesRequired=admin
CreateUninstallRegKey=no

UninstallDisplayName=MindDock
UninstallDisplayIcon={app}\mindDock\mindDock.exe

[Files]
Source: "dist\mindDock\*"; DestDir: "{app}\mindDock"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "mindDock.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; 시작 메뉴 그룹에 아이콘 추가
Name: "{group}\MindDock"; Filename: "{app}\mindDock\mindDock.exe"; IconFilename: "{app}\mindDock.ico"
; 바탕화면 아이콘 추가 (선택 사항)
Name: "{userdesktop}\MindDock"; Filename: "{app}\mindDock\mindDock.exe"; IconFilename: "{app}\mindDock.ico"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "바탕화면에 아이콘 생성"; GroupDescription: "추가 아이콘:"
; 'runminddock' 항목 추가
Name: "runminddock"; Description: "MindDock 실행하기"; GroupDescription: "설치 완료 후 실행:"

[Run]
; Tasks 섹션에서 정의한 'runminddock' 항목을 체크했을 경우에만 MindDock.exe 실행
; 프로그램이 실행되면 Readme.txt가 생성될 것으로 가정합니다.
Filename: "{app}\mindDock\mindDock.exe"; Description: "MindDock 실행하기"; Flags: postinstall skipifsilent; Tasks: runminddock

[Registry]
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\MindDock"; ValueType: string; ValueName: "DisplayName"; ValueData: "MindDock"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\MindDock"; ValueType: string; ValueName: "DisplayVersion"; ValueData: "1.0"
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\MindDock"; ValueType: string; ValueName: "Publisher"; ValueData: "BTLee"
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\MindDock"; ValueType: string; ValueName: "InstallLocation"; ValueData: "{app}"
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\MindDock"; ValueType: string; ValueName: "DisplayIcon"; ValueData: "{app}\mindDock\mindDock.exe"
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\MindDock"; ValueType: string; ValueName: "UninstallString"; ValueData: """{uninstallexe}"""