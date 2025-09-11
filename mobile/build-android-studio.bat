@echo off
echo WYN Management Android Build - Android Studio Method
echo.

REM Navigate to mobile directory
cd /d "%~dp0"

REM Copy website files to www directory
echo Copying website files...
xcopy /E /Y "..\index.html" "www\"
xcopy /E /Y "..\assets" "www\assets\"
xcopy /E /Y "..\pages" "www\pages\"
xcopy /E /Y "..\api" "www\api\"

echo.
echo Files copied successfully!
echo.
echo NEXT STEPS:
echo 1. Open Android Studio
echo 2. Select "Open an existing Android Studio project"
echo 3. Navigate to: %CD%\platforms\android
echo 4. Open the project
echo 5. Wait for Gradle sync to complete
echo 6. Click "Build" > "Build Bundle(s) / APK(s)" > "Build APK(s)"
echo.
echo The APK will be generated in:
echo platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo For release APK:
echo 1. Click "Build" > "Generate Signed Bundle / APK"
echo 2. Select "APK" and click "Next"
echo 3. Create or select a keystore
echo 4. Fill in the signing information
echo 5. Select "release" build variant
echo 6. Click "Finish"
echo.

pause
