$fileNamePrefix = "sample_"
$copySrcDir  = $env:USERPROFILE + "\Documents\work\"
$copyDestDir = $env:USERPROFILE + "\Documents\work\copied\"

$fileNameTerm = $fileNamePrefix + "*"
Set-Location -Path $copySrcDir
$files = Get-Item $fileNameTerm

if(test-path $copyDestDir){
}else{
  New-Item $copyDestDir -ItemType Directory
}

foreach($f in $files){
  # Write-Host($f)          # C:\Users\USERNAME\Documents\work\sample_00
  # Write-Host($f.BaseName) # sample_00
  Copy-Item $f $copyDestDir
  Set-Location -Path $copyDestDir
  $commitMessage = "Create " + $f.BaseName
  git add $fileNameTerm
  git commit -m $commitMessage
  git push
}
