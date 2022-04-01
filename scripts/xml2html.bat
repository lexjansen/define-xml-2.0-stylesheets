@echo off

if /i (%1) == () (
  echo Usage: %~n0 ^<stylesheet^> ^<xmlfile^> ^<htmlfile^>
  echo.
  goto :EOF
)

set xsl=%1
set xml=%2
set html=%3

set PSCmd=$XsltSettings = New-Object System.Xml.Xsl.XsltSettings
set PSCmd=%PSCmd%; $XsltSettings.EnableDocumentFunction = 1

set PSCmd=%PSCmd%; $xslt=New-Object System.Xml.Xsl.XslCompiledTransform
set PSCmd=%PSCmd%; $xslt.Load('%xsl%', $XsltSettings, $(New-Object System.Xml.XmlUrlResolver))
set PSCmd=%PSCmd%; $xslt.Transform('%xml%','%html%');

powershell -command "& {%PSCmd%}"

