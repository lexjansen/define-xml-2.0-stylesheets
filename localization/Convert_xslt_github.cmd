@echo off

set project=C:\_projects\define-xml-2.0-stylesheets

set Jars=C:\Program Files\SASHome\SASGraphJavaApplets\9.4
REM set CLASSPATH=%Jars%\xml-apis.jar;%Jars%\serializer.jar;%Jars%\xalan.jar;%Jars%\xercesImpl.jar;%CLASSPATH%
set classpath=%classpath%;C:\Apache\SaxonHE9-7-0-18J\saxon9he.jar

set stylesheet=%project%\localization\stylesheets\define2-0.xsl

set log="%~n0.log"
echo.>%log%


call :transform arm-jp %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam_jp.html "interfaceLang=jp"
call :transform arm-zh %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam_zh.html "interfaceLang=zh"
call :transform arm-en %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam_en.html "interfaceLang=en"
call :transform arm    %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam_default.html

call :transform arm-jp %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm_jp.html "interfaceLang=jp"
call :transform arm-zh %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm_zh.html "interfaceLang=zh"
call :transform arm-en %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm_en.html "interfaceLang=en"
call :transform arm    %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm_default.html

call :transform sdtm-jp %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm_jp.html "interfaceLang=jp"
call :transform sdtm-zh %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm_zh.html "interfaceLang=zh"
call :transform sdtm-en %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm_en.html "interfaceLang=en"
call :transform sdtm    %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm_default.html

call :transform sdtm-jp %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test_jp.html "interfaceLang=jp"
call :transform sdtm-zh %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test_zh.html "interfaceLang=zh"
call :transform sdtm-en %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test_en.html "interfaceLang=en"
call :transform sdtm    %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test_default.html
  


call :transform2 arm-jp %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam.parameters_jp.html "interfaceLang=jp"
call :transform2 arm-zh %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam.parameters_zh.html "interfaceLang=zh"
call :transform2 arm-en %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam.parameters_en.html "interfaceLang=en"
call :transform2 arm    %project%\localization\xml\define.cdisc.adam.xml %stylesheet% %project%\localization\html\define.cdisc.adam.parameters_default.html

call :transform2 arm-jp %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm.parameters_jp.html "interfaceLang=jp"
call :transform2 arm-zh %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm.parameters_zh.html "interfaceLang=zh"
call :transform2 arm-en %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm.parameters_en.html "interfaceLang=en"
call :transform2 arm    %project%\localization\xml\define.cdisc.arm.xml %stylesheet% %project%\localization\html\define.cdisc.arm.parameters_default.html

call :transform2 sdtm-jp %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm.parameters_jp.html "interfaceLang=jp"
call :transform2 sdtm-zh %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm.parameters_zh.html "interfaceLang=zh"
call :transform2 sdtm-en %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm.parameters_en.html "interfaceLang=en"
call :transform2 sdtm    %project%\localization\xml\define.cdisc.sdtm.xml %stylesheet% %project%\localization\html\define.cdisc.sdtm.parameters_default.html

call :transform2 sdtm-jp %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test.parameters_jp.html "interfaceLang=jp"
call :transform2 sdtm-zh %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test.parameters_zh.html "interfaceLang=zh"
call :transform2 sdtm-en %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test.parameters_en.html "interfaceLang=en"
call :transform2 sdtm    %project%\localization\xml\define.phuse.test.xml %stylesheet% %project%\localization\html\define.phuse.test.parameters_default.html
  
type %log%

echo.
echo done!

PING localhost -n 3 >NUL

goto :EOF


:convert

set xml=%1
set xsl=%2
set out=%3
set lang=%4

javaw -XX:+HeapDumpOnOutOfMemoryError -Xms256m -Xmx1024m org.apache.xalan.xslt.Process -param interfaceLang "%lang%" -IN "%xml%" -XSL %xsl% -OUT "%out%" >> %log% 2>&1

goto :EOF


:transform

echo **** %1 ****
echo **** xml:   %2 ****
echo **** xsl:   %3 ****
echo **** html:  %4 ****
echo **** param: %5 ****
echo.

echo Transform -s:%2 -xsl:%3 -o:%4  >> %log% 2>&1
set param1=%5
set param2=displayCommentsTable="0"
set param3=displayPrefix="0"
set param4=displayLengthDFormatSD="0"


if (%param1%)==() (
  echo java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param2% %param3% %param4% >> %log%
  java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param2% %param3% %param4% >> %log% 2>&1
  ) else (
  echo java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param1:"=% %param2% %param3% %param4% >> %log%
  java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param1:"=% %param2% %param3% %param4% >> %log% 2>&1
  )
echo.>> %log%
goto :EOF

:transform2

echo **** %1 ****
echo **** xml:   %2 ****
echo **** xsl:   %3 ****
echo **** html:  %4 ****
echo **** param: %5 ****
echo.

echo Transform -s:%2 -xsl:%3 -o:%4  >> %log% 2>&1
set param1=%5
set param2=displayCommentsTable="1"
set param3=displayPrefix="1"
set param4=displayLengthDFormatSD="1"


if (%param1%)==() (
  echo java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param2% %param3% %param4% >> %log%
  java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param2% %param3% %param4% >> %log% 2>&1
  ) else (
  echo java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param1:"=% %param2% %param3% %param4% >> %log%
  java net.sf.saxon.Transform -s:%2 -xsl:%3 -o:%4 -versionmsg:off %param1:"=% %param2% %param3% %param4% >> %log% 2>&1
  )
echo.>> %log%
goto :EOF
