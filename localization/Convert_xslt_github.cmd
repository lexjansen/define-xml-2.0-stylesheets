@echo off

set project=.

set classpath=%classpath%;..\lib\SaxonHE9-9-1-7J\saxon9he.jar

set stylesheet=%project%\stylesheets\define2-0.xsl

set log="%~n0.log"
echo.>%log%


call :transform adam-ja %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam_ja.html "interfaceLang=ja"
call :transform adam-zh %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam_zh.html "interfaceLang=zh"
call :transform adam-en %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam_en.html "interfaceLang=en"
call :transform adam    %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam_default.html

call :transform arm-ja %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm_ja.html "interfaceLang=ja"
call :transform arm-zh %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm_zh.html "interfaceLang=zh"
call :transform arm-en %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm_en.html "interfaceLang=en"
call :transform arm    %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm_default.html

call :transform sdtm-ja %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm_ja.html "interfaceLang=ja"
call :transform sdtm-zh %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm_zh.html "interfaceLang=zh"
call :transform sdtm-en %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm_en.html "interfaceLang=en"
call :transform sdtm    %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm_default.html

call :transform phuse-ja %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test_ja.html "interfaceLang=ja"
call :transform phuse-zh %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test_zh.html "interfaceLang=zh"
call :transform phuse-en %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test_en.html "interfaceLang=en"
call :transform phuse    %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test_default.html
  


call :transform_params adam-ja %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam.parameters_ja.html "interfaceLang=ja"
call :transform_params adam-zh %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam.parameters_zh.html "interfaceLang=zh"
call :transform_params adam-en %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam.parameters_en.html "interfaceLang=en"
call :transform_params adam    %project%\xml\define.cdisc.adam.xml %stylesheet% %project%\html\define.cdisc.adam.parameters_default.html

call :transform_params arm-ja %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm.parameters_ja.html "interfaceLang=ja"
call :transform_params arm-zh %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm.parameters_zh.html "interfaceLang=zh"
call :transform_params arm-en %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm.parameters_en.html "interfaceLang=en"
call :transform_params arm    %project%\xml\define.cdisc.arm.xml %stylesheet% %project%\html\define.cdisc.arm.parameters_default.html

call :transform_params sdtm-ja %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm.parameters_ja.html "interfaceLang=ja"
call :transform_params sdtm-zh %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm.parameters_zh.html "interfaceLang=zh"
call :transform_params sdtm-en %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm.parameters_en.html "interfaceLang=en"
call :transform_params sdtm    %project%\xml\define.cdisc.sdtm.xml %stylesheet% %project%\html\define.cdisc.sdtm.parameters_default.html

call :transform_params phuse-ja %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test.parameters_ja.html "interfaceLang=ja"
call :transform_params phuse-zh %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test.parameters_zh.html "interfaceLang=zh"
call :transform_params phuse-en %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test.parameters_en.html "interfaceLang=en"
call :transform_params phuse    %project%\xml\define.phuse.test.xml %stylesheet% %project%\html\define.phuse.test.parameters_default.html
  
type %log%

echo.
echo done!

PING localhost -n 3 >NUL

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

:transform_params

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
