<#
.SYNOPSIS
    Transform Define-XML documents to HTML using Saxon XSLT processor.

.DESCRIPTION
    This script runs the full test suite for Define-XML v2.1 stylesheets.
    It transforms test XML files to HTML with various language and parameter combinations.

    Cross-platform compatible: Works on Windows, Linux, and macOS with PowerShell Core (pwsh).

.NOTES
    Requires Java 8 or higher to be installed and in PATH.
    Saxon HE 12.9 JAR file must be present in ../lib/SaxonHE12-9J/
#>

[CmdletBinding()]
param()

# Setup paths (cross-platform compatible)
$project = ".."
$pathSep = [System.IO.Path]::PathSeparator
$env:CLASSPATH = "$env:CLASSPATH$pathSep$project/lib/SaxonHE12-9J/saxon-he-12.9.jar"
$stylesheet = "$project/localization/define2-0.xsl"
$logFile = "transform_definexml.log"

# Initialize log file
"" | Out-File -FilePath $logFile -Encoding utf8

function Invoke-Transform {
    param(
        [string]$Name,
        [string]$XmlFile,
        [string]$XslFile,
        [string]$HtmlFile,
        [string]$CustomParam = ""
    )

    Write-Host "**** $Name"
    Write-Host "**** xml:   $XmlFile"
    Write-Host "**** xsl:   $XslFile"
    Write-Host "**** html:  $HtmlFile"
    Write-Host "**** param: $CustomParam"
    Write-Host ""

    "Transform -s:$XmlFile -xsl:$XslFile -o:$HtmlFile" | Out-File -FilePath $logFile -Append -Encoding utf8

    $param2 = 'displayCommentsTable="0"'
    $param3 = 'displayPrefix="0"'
    $param4 = 'displayLengthDFormatSD="0"'

    # Build arguments array for Saxon Transform
    $saxonArgs = @(
        'net.sf.saxon.Transform'
        '-t'
        "-s:$XmlFile"
        "-xsl:$XslFile"
        "-o:$HtmlFile"
        '-versionmsg:off'
    )

    if (-not [string]::IsNullOrEmpty($CustomParam)) {
        $saxonArgs += $CustomParam.Replace('"', '')
    }

    $saxonArgs += $param2, $param3, $param4

    # Log the command
    "java $($saxonArgs -join ' ')" | Out-File -FilePath $logFile -Append -Encoding utf8

    # Execute and capture all output (stdout and stderr) using pure PowerShell
    # Convert ErrorRecords to plain text to avoid PowerShell formatting
    $output = & java $saxonArgs 2>&1 | ForEach-Object {
        if ($_ -is [System.Management.Automation.ErrorRecord]) {
            $_.TargetObject
        } else {
            $_
        }
    }
    $output | Out-File -FilePath $logFile -Append -Encoding utf8

    "" | Out-File -FilePath $logFile -Append -Encoding utf8
}

function Invoke-TransformWithParams {
    param(
        [string]$Name,
        [string]$XmlFile,
        [string]$XslFile,
        [string]$HtmlFile,
        [string]$CustomParam = ""
    )

    Write-Host "**** $Name ****"
    Write-Host "**** xml:   $XmlFile ****"
    Write-Host "**** xsl:   $XslFile ****"
    Write-Host "**** html:  $HtmlFile ****"
    Write-Host "**** param: $CustomParam ****"
    Write-Host ""

    "Transform -s:$XmlFile -xsl:$XslFile -o:$HtmlFile" | Out-File -FilePath $logFile -Append -Encoding utf8

    $param2 = 'displayCommentsTable="1"'
    $param3 = 'displayPrefix="1"'
    $param4 = 'displayLengthDFormatSD="1"'

    # Build arguments array for Saxon Transform
    $saxonArgs = @(
        'net.sf.saxon.Transform'
        '-t'
        "-s:$XmlFile"
        "-xsl:$XslFile"
        "-o:$HtmlFile"
        '-versionmsg:off'
    )

    if (-not [string]::IsNullOrEmpty($CustomParam)) {
        $saxonArgs += $CustomParam.Replace('"', '')
    }

    $saxonArgs += $param2, $param3, $param4

    # Log the command
    "java $($saxonArgs -join ' ')" | Out-File -FilePath $logFile -Append -Encoding utf8

    # Execute and capture all output (stdout and stderr) using pure PowerShell
    # Convert ErrorRecords to plain text to avoid PowerShell formatting
    $output = & java $saxonArgs 2>&1 | ForEach-Object {
        if ($_ -is [System.Management.Automation.ErrorRecord]) {
            $_.TargetObject
        } else {
            $_
        }
    }
    $output | Out-File -FilePath $logFile -Append -Encoding utf8

    "" | Out-File -FilePath $logFile -Append -Encoding utf8
}

# ADaM transformations with different languages
Invoke-Transform "adam-ja" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam_ja.html" "interfaceLang=ja"
Invoke-Transform "adam-zh" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam_zh.html" "interfaceLang=zh"
Invoke-Transform "adam-en" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam_en.html" "interfaceLang=en"
Invoke-Transform "adam" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam_default.html"

# ADAM ARM transformations with different languages
Invoke-Transform "arm-ja" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm_ja.html" "interfaceLang=ja"
Invoke-Transform "arm-zh" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm_zh.html" "interfaceLang=zh"
Invoke-Transform "arm-en" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm_en.html" "interfaceLang=en"
Invoke-Transform "arm" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm_default.html"

# SDTM transformations with different languages
Invoke-Transform "sdtm-ja" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm_ja.html" "interfaceLang=ja"
Invoke-Transform "sdtm-zh" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm_zh.html" "interfaceLang=zh"
Invoke-Transform "sdtm-en" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm_en.html" "interfaceLang=en"
Invoke-Transform "sdtm" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm_default.html"

# PHUSE transformations with different languages
Invoke-Transform "phuse-ja" "$project/test/xml/define.phuse.test.xml" $stylesheet "$project/test/html/define.phuse.test_ja.html" "interfaceLang=ja"
Invoke-Transform "phuse-zh" "$project/test/xml/define.phuse.test.xml" $stylesheet "$project/test/html/define.phuse.test_zh.html" "interfaceLang=zh"
Invoke-Transform "phuse-en" "$project/test/xml/define.phuse.test.xml" $stylesheet "$project/test/html/define.phuse.test_en.html" "interfaceLang=en"
Invoke-Transform "phuse" "$project/test/xml/define.phuse.test.xml" $stylesheet "$project/test/html/define.phuse.test_default.html"

# ADaM transformations with parameters displayed
Invoke-TransformWithParams "adam-ja" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam.parameters_ja.html" "interfaceLang=ja"
Invoke-TransformWithParams "adam-zh" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam.parameters_zh.html" "interfaceLang=zh"
Invoke-TransformWithParams "adam-en" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam.parameters_en.html" "interfaceLang=en"
Invoke-TransformWithParams "adam" "$project/test/xml/define.cdisc.adam.xml" $stylesheet "$project/test/html/define.cdisc.adam.parameters_default.html"

# ADaM ARM transformations with parameters displayed
Invoke-TransformWithParams "arm-ja" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm.parameters_ja.html" "interfaceLang=ja"
Invoke-TransformWithParams "arm-zh" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm.parameters_zh.html" "interfaceLang=zh"
Invoke-TransformWithParams "arm-en" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm.parameters_en.html" "interfaceLang=en"
Invoke-TransformWithParams "arm" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/define.cdisc.arm.parameters_default.html"

# SDTM transformations with parameters displayed
Invoke-TransformWithParams "sdtm-ja" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm.parameters_ja.html" "interfaceLang=ja"
Invoke-TransformWithParams "sdtm-zh" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm.parameters_zh.html" "interfaceLang=zh"
Invoke-TransformWithParams "sdtm-en" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm.parameters_en.html" "interfaceLang=en"
Invoke-TransformWithParams "sdtm" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/define.cdisc.sdtm.parameters_default.html"

# Issue-specific tests
Invoke-Transform "adam" "$project/test/xml/define.cdisc.adam_issue09.xml" $stylesheet "$project/test/html/issue09/define.cdisc.adam_issue09.html"

Invoke-Transform "adam" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/issue14/define.cdisc.arm_issue14.html"
Invoke-Transform "adam" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/issue14/define.cdisc.arm_issue14_all_decodes.html" "nCheckValueDisplay=999"
Invoke-Transform "adam" "$project/test/xml/define.cdisc.arm.xml" $stylesheet "$project/test/html/issue14/define.cdisc.arm_issue14_no_decodes.html" "nCheckValueDisplay=0"
Invoke-Transform "sdtm" "$project/test/xml/define.cdisc.sdtm.xml" $stylesheet "$project/test/html/issue14/define.cdisc.sdtm_issue14.html" "nCheckValueDisplay=3"

Write-Host "Transformation complete. Check $logFile for details."
