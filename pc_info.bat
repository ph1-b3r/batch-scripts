@ echo off

title GetInfo(); By Tanny!&cls&

color 9 
wmic baseboard list brief
wmic cpu get name
wmic MEMORYCHIP get BankLabel, DeviceLocator, Capacity, Speed
wmic os get Caption
wmic diskdrive get model,size
wmic logicaldisk get name,size
wmic sounddev get Caption
wmic path win32_VideoController get name
wmic nic get caption

REM wmic product get name

PAUSE
