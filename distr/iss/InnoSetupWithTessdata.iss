; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#ifexist "defines.iss"
#include "defines.iss"
#endif

#ifndef MyAppVersion
#define MyAppVersion "1.0.0"
#endif 

#define MyAppName "Screen Translator"
#define MyAppPublisher "Gres"
#define MyAppURL "http://gres.biz/screen-translator/"
#define MyAppExeName "ScreenTranslator.exe"    
#define MyAppDescription "Screen capture and translation tool"  

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{016F399E-0EED-476C-AB00-8AD0FF5BFD77}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes   
PrivilegesRequired=admin
CloseApplications=yes
OutputDir=..
OutputBaseFilename=screen-translator-offline-{#MyAppVersion}
SetupIconFile=icon.ico
RestartIfNeededByRun=False
ShowLanguageDialog=auto             
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyAppDescription}
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoVersion={#MyAppVersion}
Compression=lzma2/ultra64
InternalCompressLevel=ultra   
SolidCompression=yes     

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"; LicenseFile: "LICENSE_en.md"; InfoBeforeFile: "Changelog_en.txt"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"; LicenseFile: "LICENSE_ru.md"; InfoBeforeFile: "Changelog_ru.txt"  

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked        
Name: "startupicon"; Description: "{cm:CreateStartupIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1  

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon      
Name: "{commonstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: startupicon   

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Files]
Source: "content\ScreenTranslator.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: Executable  
Source: "content\*.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: Libraries
Source: "content\platforms\*"; DestDir: "{app}\platforms"; Flags: ignoreversion; Components: Libraries  
Source: "content\translators\*"; DestDir: "{app}\translators"; Flags: ignoreversion; Components: Translators

[Types] 
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "Executable"; Description: "{cm:Executables}"; Types: custom; Flags: fixed;
Name: "Libraries"; Description: "{cm:Libraries}"; Types: custom; Flags: fixed;   
Name: "Translators"; Description: "{cm:Translators}"; Types: custom; Flags: fixed;

[CustomMessages]
en.CreateStartupIcon=Create autostart icon
en.Executables=Executables 
en.Libraries=Libraries     
en.Translators=Translators

ru.CreateStartupIcon=�������� � ����������
ru.Executables=����������� �����
ru.Libraries=����������
ru.Translators=�����������

#include "tessdataBuiltin.iss"

[UninstallDelete]
Type: files; Name: "{app}\updates.json"    
Type: files; Name: "{app}\st_subs.csv"

[UninstallRun]
Filename: "taskkill.exe"; Parameters: "/IM ScreenTranslator.exe /T /F"


[Code]               
#define DwinsHs_Use_Predefined_Downloading_WizardPage
#define DwinsHs_Auto_Continue
#include "dwinshs.iss"

procedure InitializeWizard();
begin
  DwinsHs_InitializeWizard(wpPreparing);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  DwinsHs_CurPageChanged(CurPageID, nil, nil);
end;

function ShouldSkipPage(CurPageId: Integer): Boolean;
begin
  Result := False;
  DwinsHs_ShouldSkipPage(CurPageId, Result);
end;

function BackButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  DwinsHs_BackButtonClick(CurPageID);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  DwinsHs_NextButtonClick(CurPageID, Result);
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  DwinsHs_CancelButtonClick(CurPageID, Cancel, Confirm);
end;
  
[CustomMessages]
ru.DwinsHs_PageCaption =�������� ������
ru.DwinsHs_PageDescription =����������, ��������� ��������� ��������...
ru.DwinsHs_TotalProgress =����� ��������:
ru.DwinsHs_CurrentFile =������� ����:
ru.DwinsHs_File =����:
ru.DwinsHs_Speed =��������:
ru.DwinsHs_Status =������:
ru.DwinsHs_ElapsedTime =����������� �����:
ru.DwinsHs_RemainingTime =���������� �����:

ru.DwinsHs_Status_GetFileInformation =��������� ������� �����
ru.DwinsHs_Status_StartingDownload =������ ��������
ru.DwinsHs_Status_Downloading =��������
ru.DwinsHs_Status_DownlaodComplete =�������� ���������          
