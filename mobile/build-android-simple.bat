@echo off
echo Building WYN Management Android App...

REM Navigate to mobile directory
cd /d "%~dp0"

REM Copy website files to www directory
echo Copying website files...
xcopy /E /Y "..\index.html" "www\"
xcopy /E /Y "..\assets" "www\assets\"
xcopy /E /Y "..\pages" "www\pages\"
xcopy /E /Y "..\api" "www\api\"

REM Navigate to Android platform
cd platforms\android

REM Clean previous builds
echo Cleaning previous builds...
if exist "app\build" rmdir /s /q "app\build"

REM Check if Gradle is available
where gradle >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Gradle not found in PATH. Please install Gradle or use Android Studio to build.
    echo Alternative: Open this project in Android Studio and build from there.
    pause
    exit /b 1
)

REM Build debug APK
echo Building debug APK...
gradle assembleDebug

REM Build release APK
echo Building release APK...
gradle assembleRelease

echo.
echo Android build complete!
echo Debug APK: app\build\outputs\apk\debug\app-debug.apk
echo Release APK: app\build\outputs\apk\release\app-release-unsigned.apk
echo.
echo To sign the release APK for Play Store:
echo 1. Generate keystore: keytool -genkey -v -keystore wyn-management-release-key.keystore -alias wyn-management-key -keyalg RSA -keysize 2048 -validity 10000
echo 2. Sign APK: jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore wyn-management-release-key.keystore app-release-unsigned.apk wyn-management-key
echo 3. Align APK: zipalign -v 4 app-release-unsigned.apk WYN-Management.apk

pause
