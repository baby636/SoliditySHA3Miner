@echo off
pushd %~dp0

for %%X in (dotnet.exe) do (set FOUND=%%~$PATH:X)
if defined FOUND (goto dotNetFound) else (goto dotNetNotFound)

:dotNetNotFound
echo .NET Core is not found or not installed,
echo download and install from https://www.microsoft.com/net/download/windows/run
goto end

:dotNetFound
:startMiner
DEL /F /Q SoliditySHA3Miner.conf

SoliditySHA3Miner.exe ^
masterMode=true ^
allowCPU=false ^
allowIntel=false ^
allowAMD=false ^
allowCUDA=false ^
networkUpdateInterval=10000 ^
abiFile=0xBTC.abi ^
contract=0xB6eD7644C69416d67B522e20bC294A9a9B405B31 ^
overrideMaxTarget=27606985387162255149739023449108101809804435888681546220650096895197184 ^
pool=http://mike.rs:8080 ^
address=0x9172ff7884CEFED19327aDaCe9C470eF1796105c

goto startMiner
:end
pause