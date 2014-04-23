!define ARCH_TAG ""
!define PRODUCT_ICON "corps_castle.ico"
!define INSTALLER_NAME "Install_CorpsTools.exe"
!define PRODUCT_VERSION "0.1-dev"
!define PRODUCT_NAME "Corps Tools"

; Definitions will be added above
 
SetCompressor lzma

; Modern UI installer stuff 
!include "MUI2.nsh"
!define MUI_ABORTWARNING
!define MUI_ICON "corps_castle.ico"

; UI pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${INSTALLER_NAME}"
InstallDir "C:\corpstools"
ShowInstDetails show

Section -SETTINGS
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
SectionEnd

Section "Cygwin Setup" sec_cygwin
  File "corps_castle.ico"
  File /r "corpstools_cygwin_base"
  File "setup-x86_64.exe"
; these paths were generated from cygstack.txt
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "_autorebase,_update-info-dir,alternatives,autoconf,autoconf2.1,autoconf2.5,automake,automake1.10,automake1.11,automake1.12,automake1.13,automake1.14,automake1.4,automake1.5,automake1.6,automake1.7,automake1.8,automake1.9,automoc4,base-cygwin,base-files,bash,binutils,bzip2,ca-certificates"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "cmake,coreutils,crypt,csih,cygrunsrv,cygutils,cygwin,cygwin-debuginfo,dash,dbus,desktop-file-utils,diffutils,editrights,emacs,file,findutils,fixesproto,gamin,gawk,gcc-core,gcc-fortran,gcc-g++,gcc-objc,gcc-objc++,gcc-tools-epoch1-autoconf,gcc-tools-epoch1-automake,gcc-tools-epoch2-autoconf"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "gcc-tools-epoch2-automake,gettext,git,grep,groff,gsettings-desktop-schemas,gzip,hostname,inputproto,ipc-utils,jasper,kbproto,lapack,less,libapr1,libaprutil1,libarchive13,libasn1_8,libasprintf0,libasyncns0,libatomic1,libattr1,libaudio-devel,libaudio2,libboost-devel,libboost1.53,libboost_python-devel,libboost_python1.53,libboost_python3-devel,libboost_python3_1.53,libbz2-devel,libbz2_1,libcairo-devel,libcairo2,libcharset1,libcloog-isl4"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libcloog0,libcom_err2,libcrypt0,libcurl4,libdb5.3,libdbus1-devel,libdbus1_3,libedit0,libexpat-devel,libexpat1,libfam0,libffi-devel,libffi6,libFLAC8,libfontconfig-devel,libfontconfig1,libfreetype-devel,libfreetype6,libgcc1,libgcrypt11,libgdbm4,libgfortran3,libgif4,libGL1,libglapi0,libglib2.0-devel"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libglib2.0_0,libgmp10,libgmpxx4,libgnutls28,libgomp1,libgpg-error0,libgssapi3,libgstinterfaces0.10_0,libgstreamer0.10_0,libheimbase1,libheimntlm0,libhogweed2,libhx509_5,libICE-devel,libICE6,libiconv-devel,libiconv2,libicu-devel,libicu51,libidn11,libintl8,libiodbc2,libisl10,libjasper-devel"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libjpeg8,libjson-c-common,libjson-c2,libkrb5_26,liblapack-devel,liblapack0,liblcms1,liblcms2_2,liblzma5,liblzo2_2,libming1,libmng1,libmpc3,libmpfr4,libmysqlclient18,libncursesw-devel,libncursesw10,libneon27,libnettle4,libobjc4,libogg0,libopenjpeg1,libopenldap2_4_2,libopenmpi,libopenmpi-devel"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libopenmpicxx1,libopenmpifh2,libopenmpiuse1,libopenssl100,liborc0.4_0,libp11-kit0,libpcre-devel,libpcre1,libpcre16_0,libpcre32_0,libpcrecpp0,libpcreposix0,libphonon-devel,libphonon4,libpixman1-devel,libpixman1_0,libpng-devel,libpng15,libpoppler-devel,libpoppler-qt4-devel,libpoppler-qt4_4"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libpoppler37,libpopt0,libppl9,libppl_c4,libpq5,libproxy1,libpulse-mainloop-glib0,libpulse0,libpwl5,libQtCore4,libQtCore4-devel,libQtDBus4,libQtDBus4-devel,libQtDeclarative4,libQtDesigner4,libQtGui4,libQtGui4-devel,libQtNetwork4,libQtOpenGL4,libQtScript4,libQtSql4,libQtXml4,libQtXml4-devel"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libQtXmlPatterns4,libquadmath0,libqzeitgeist-common,libqzeitgeist-devel,libqzeitgeist1,libreadline7,libRmath,libRmath-devel,libroken18,libsasl2_3,libserf1_0,libSM-devel,libSM6,libsndfile1,libsqlite3-devel,libsqlite3_0,libssh2_1,libssp0,libstdc++6,libsybdb5,libtasn1_6,libtool,libtiff5,libuuid-devel"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libuuid1,libvorbis,libvorbis0,libvorbisenc2,libwind0,libwrap0,libX11-devel,libX11-xcb1,libX11_6,libXau-devel,libXau6,libxcb-devel,libxcb-glx0,libxcb-render-devel,libxcb-render0,libxcb-shm-devel,libxcb-shm0,libxcb1,libXcursor-devel,libXcursor1,libXdmcp-devel,libXdmcp6,libXext-devel,libXext6"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "libXfixes-devel,libXfixes3,libXft2,libXi-devel,libXi6,libXinerama-devel,libXinerama1,libxml2,libXmu6,libXrandr-devel,libXrandr2,libXrender-devel,libXrender1,libXss1,libXt-devel,libXt6,login,m4,make,man,mintty,ncurses,openmpi,openssh,openssl,patch,perl,perl-Error,phonon-backend-gstreamer"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "poppler-data,python,python-crypto,python-feedparser,python-ming,python-paramiko,python-tkinter,randrproto,rebase,renderproto,rsync,run,sed,shared-mime-info,subversion,subversion-python,tar,tcl,tcl-tix,tcl-tk,terminfo,texinfo,tzcode,vim-minimal,w32api-headers,w32api-runtime,wget,which"'
  ExecWait '$INSTDIR\setup-x86_64.exe -R "$INSTDIR\cygwin64" -L -l "$INSTDIR\corpstools_cygwin_base" -q -P "xextproto,xineramaproto,xproto,xz,zlib-devel,zlib0,zsh"'
  SetOutPath "$INSTDIR\cygwin64"
  File "setup-x86_64.exe"
  File /r "proteus"
  File "path_demo.ipynb"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}.lnk" "$INSTDIR\cygwin64\bin\bash.exe" \
      '-l -c "export PATH=/proteus/cygwin/bin:$PATH; BROWSER=cygstart.exe /proteus/cygwin/bin/ipython notebook /path_demo.ipynb"' \
      "$INSTDIR\corps_castle.ico"
  File /r "proteus-mprans"
  CreateShortCut "$SMPROGRAMS\Numerical Wavetank - IWall 2D.lnk" "$INSTDIR\cygwin64\bin\bash.exe" \
      '-l -c "export PATH=/proteus/cygwin/bin:$PATH; BROWSER=cygstart.exe /proteus/cygwin/bin/ipython notebook /proteus-mprans/benchmarks/iwall2D/NumericalTank2Dserial.ipynb"' \
      "$INSTDIR\corps_castle.ico"
  CreateShortCut "$SMPROGRAMS\CorpsTools Console.lnk" "$INSTDIR\cygwin64\bin\mintty.exe" '-'

SectionEnd

Section "!${PRODUCT_NAME}" sec_app
  SectionIn RO
  SetOutPath "$INSTDIR"
  ;EXTRA_FILES_INSTALL
  ;-------------------

  WriteUninstaller $INSTDIR\uninstall.exe
  ; Add ourselves to Add/remove programs
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                   "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                   "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                   "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                   "DisplayIcon" "$INSTDIR\${PRODUCT_ICON}"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                   "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                   "NoRepair" 1

  StrCpy $0 "$INSTDIR\install.log"
  Push $0
  Call DumpLog
SectionEnd

Section "Uninstall"
  Delete $INSTDIR\uninstall.exe
  Delete "$INSTDIR\${PRODUCT_ICON}"
  RMDir /r "$INSTDIR\corpstools_cygwin_base"
  ;EXTRA_FILES_UNINSTALL
  ;---------------------
  Delete "$SMPROGRAMS\${PRODUCT_NAME}.lnk"
  RMDir $INSTDIR
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
SectionEnd

; Functions

Function .onMouseOverSection
    ; Find which section the mouse is over, and set the corresponding description.
    FindWindow $R0 "#32770" "" $HWNDPARENT
    GetDlgItem $R0 $R0 1043 ; description item (must be added to the UI)

    StrCmp $0 ${sec_app} "" +2
      SendMessage $R0 ${WM_SETTEXT} 0 "STR:${PRODUCT_NAME}"
FunctionEnd

!define LVM_GETITEMTEXT 0x102D
 
Function DumpLog
  Exch $5
  Push $0
  Push $1
  Push $2
  Push $3
  Push $4
  Push $6
 
  FindWindow $0 "#32770" "" $HWNDPARENT
  GetDlgItem $0 $0 1016
  StrCmp $0 0 exit
  FileOpen $5 $5 "w"
  StrCmp $5 "" exit
    SendMessage $0 ${LVM_GETITEMCOUNT} 0 0 $6
    System::Alloc ${NSIS_MAX_STRLEN}
    Pop $3
    StrCpy $2 0
    System::Call "*(i, i, i, i, i, i, i, i, i) i \
      (0, 0, 0, 0, 0, r3, ${NSIS_MAX_STRLEN}) .r1"
    loop: StrCmp $2 $6 done
      System::Call "User32::SendMessageA(i, i, i, i) i \
        ($0, ${LVM_GETITEMTEXT}, $2, r1)"
      System::Call "*$3(&t${NSIS_MAX_STRLEN} .r4)"
      FileWrite $5 "$4$\r$\n"
      IntOp $2 $2 + 1
      Goto loop
    done:
      FileClose $5
      System::Free $1
      System::Free $3
  exit:
    Pop $6
    Pop $4
    Pop $3
    Pop $2
    Pop $1
    Pop $0
    Exch $5
FunctionEnd