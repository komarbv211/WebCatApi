@echo off

tasklist /FI "IMAGENAME eq Docker Desktop.exe" | find /I "Docker Desktop.exe" >nul
if errorlevel 1 (
    echo Docker Desktop starting ...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    :waitForDocker
    tasklist /FI "IMAGENAME eq Docker Desktop.exe" | find /I "Docker Desktop.exe" >nul
    if errorlevel 1 (
        timeout /t 10 /nobreak >nul
        goto waitForDocker
    )
    timeout /t 2 /nobreak >nul
    echo Docker Desktop successfully started ...
)

echo Building Docker image for web-cat-asp-api...
docker build -t web-cat-asp-api .

echo Docker login...
docker login

echo Tagging Docker image web-cat-asp-api...
docker tag web-cat-asp-api:latest komarandrii/web-cat-asp-api:latest

echo Pushing Docker image web-cat-asp-api to repository...
docker push komarandrii/web-cat-asp-api:latest

echo Done ---web-cat-asp-api---!

pause
