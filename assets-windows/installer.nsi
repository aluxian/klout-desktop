!include "MUI2.nsh"

Name "Klout"
BrandingText "aluxian.com"

# set the icon
!define MUI_ICON "icon.ico"

# define the resulting installer's name:
OutFile "..\dist\KloutSetup.exe"

# set the installation directory
InstallDir "$PROGRAMFILES\Klout\"

# app dialogs
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN_TEXT "Start Klout"
!define MUI_FINISHPAGE_RUN "$INSTDIR\Klout.exe"

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# default section start
Section

  # delete the installed files
  RMDir /r $INSTDIR

  # define the path to which the installer should install
  SetOutPath $INSTDIR

  # specify the files to go in the output path
  File /r ..\build\Klout\win32\*

  # create the uninstaller
  WriteUninstaller "$INSTDIR\Uninstall Klout.exe"

  # create shortcuts in the start menu and on the desktop
  CreateShortCut "$SMPROGRAMS\Klout.lnk" "$INSTDIR\Klout.exe"
  CreateShortCut "$SMPROGRAMS\Uninstall Klout.lnk" "$INSTDIR\Uninstall Klout.exe"
  CreateShortCut "$DESKTOP\Klout.lnk" "$INSTDIR\Klout.exe"

SectionEnd

# create a section to define what the uninstaller does
Section "Uninstall"

  # delete the installed files
  RMDir /r $INSTDIR

  # delete the shortcuts
  Delete "$SMPROGRAMS\Klout.lnk"
  Delete "$SMPROGRAMS\Uninstall Klout.lnk"
  Delete "$DESKTOP\Klout.lnk"

SectionEnd
