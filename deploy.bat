set BUILDDIR=_website
set TARGETDIR=..\wubw.github.io

xcopy %BUILDDIR% %TARGETDIR% /E /C /H /R /D /Y
