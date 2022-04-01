@echo off

if /i (%1) == () (
  echo Usage: %~n0 ^<stylesheet^> ^<xmlfile^> ^<htmlfile^>
  echo.
  goto :EOF
)

java -version
echo.

set xsl=%1
set xml=%2
set html=%3

set saxon_jar=/library/Java/SaxonHE10-8J/saxon-he-10.8.jar

java -jar %saxon_jar% -xsl:%xsl% -s:%xml% -o:%html%

