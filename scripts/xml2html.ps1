[CmdletBinding()]
param(
  [Parameter(Mandatory=$true, position=0)][string] $xsltfile,
  [Parameter(Mandatory=$true, position=1)][string] $xmlfile,
  [Parameter(Mandatory=$true, position=2)][string] $outfile,
  [Parameter(Mandatory=$false, position=3)][ValidateSet("en", "ja", "zh")][string] $interfaceLang = "en"
)

$xsltfile = Join-Path $(Get-Location) $xsltfile
$xmlfile = Join-Path $(Get-Location) $xmlfile
$outfile = Join-Path $(Get-Location) $outfile

echo $xsltfile
echo $xmlfile
echo $outfile
echo $interfaceLang

try {
  $XsltSettings = New-Object System.Xml.Xsl.XsltSettings
  $XsltSettings.EnableDocumentFunction = 1

  $xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
  $xslt.Load($xsltfile , $XsltSettings, $(New-Object System.Xml.XmlUrlResolver))


  [System.Xml.Xsl.XsltArgumentList]$al = [System.Xml.Xsl.XsltArgumentList]::new()
  $al.AddParam("interfaceLang", "", $interfaceLang)
  $al.AddParam("nCodeListItemDisplay", "", 5)
  $al.AddParam("displayMethodsTable", "", 1)
  $al.AddParam("displayCommentsTable", "", 0)
  $al.AddParam("displayPrefix", "", 0)
  $al.AddParam("displayLengthDFormatSD", "", 0)

  $_outFile = New-Object System.IO.FileStream($outfile, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write)

  $xslt.Transform($xmlfile, $al, $_outFile)
  $_outFile.Close()
} 
catch {
  echo $_.Exception.Message
}
finally {
}