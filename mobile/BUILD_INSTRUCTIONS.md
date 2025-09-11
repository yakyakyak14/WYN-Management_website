# WYN Management Mobile App - Build Instructions

## 🚀 Quick Start - Android Studio Method (Recommended)

### Prerequisites
1. **Download Android Studio**: https://developer.android.com/studio
2. **Install Android Studio** with default settings
3. **Open Android SDK Manager** and install:
   - Android SDK Platform 34
   - Android SDK Build-Tools 34.0.0
   - Android Emulator (optional, for testing)

### Building the Android App

#### Step 1: Prepare Files
1. Run `build-android-studio.bat` to copy website files
2. Or manually copy:
   - `../index.html` → `www/`
   - `../assets/` → `www/assets/`
   - `../pages/` → `www/pages/`
   - `../api/` → `www/api/`

#### Step 2: Open in Android Studio
1. Launch Android Studio
2. Click "Open an existing Android Studio project"
3. Navigate to: `mobile/platforms/android/`
4. Click "OK" to open the project

#### Step 3: Wait for Sync
- Android Studio will automatically sync Gradle
- Wait for "Gradle sync finished" message
- If prompted, accept any SDK downloads

#### Step 4: Build APK
**For Debug APK (Testing):**
1. Click "Build" → "Build Bundle(s) / APK(s)" → "Build APK(s)"
2. Wait for build to complete
3. Click "locate" to find the APK file
4. APK location: `app/build/outputs/apk/debug/app-debug.apk`

**For Release APK (Play Store):**
1. Click "Build" → "Generate Signed Bundle / APK"
2. Select "APK" and click "Next"
3. Create new keystore or use existing:
   - **Key store path**: Choose location for `wyn-management-keystore.jks`
   - **Password**: Create secure password
   - **Key alias**: `wyn-management-key`
   - **Key password**: Create secure password
   - **Validity**: 25 years
   - **Certificate info**: Fill in your details
4. Click "Next"
5. Select "release" build variant
6. Check "V1" and "V2" signature versions
7. Click "Finish"
8. APK location: `app/release/app-release.apk`

## 📱 Testing the App

### On Emulator
1. In Android Studio, click "AVD Manager"
2. Create new virtual device (Pixel 6, API 34)
3. Click "Run" → "Run 'app'" to install and test

### On Physical Device
1. Enable "Developer Options" on your Android device
2. Enable "USB Debugging"
3. Connect device via USB
4. Click "Run" → "Run 'app'"
5. Or manually install APK: `adb install app-debug.apk`

## 🏪 Google Play Store Deployment

### Requirements
- Google Play Developer Account ($25 one-time fee)
- Signed release APK
- App store listing materials

### Upload Process
1. Go to Google Play Console: https://play.google.com/console
2. Create new app
3. Upload signed APK
4. Fill in store listing:
   - **Title**: WYN Management
   - **Short description**: Elite talent management services
   - **Full description**: Professional talent scouting, refining, managing, branding, and publicity services
   - **App icon**: 512x512 PNG
   - **Screenshots**: Various device sizes
   - **Feature graphic**: 1024x500 PNG
5. Set content rating and pricing
6. Submit for review

## 🍎 iOS App Store Deployment

### Requirements
- Apple Developer Account ($99/year)
- macOS with Xcode
- iOS provisioning profiles

### Build Process
1. Open `platforms/ios/WYN Management.xcworkspace` in Xcode
2. Select development team and signing
3. Archive the app (Product → Archive)
4. Upload to App Store Connect
5. Complete app metadata in App Store Connect
6. Submit for review

## 🛠 Troubleshooting

### Common Issues

**Gradle Sync Failed:**
- Check internet connection
- Update Android Studio
- Invalidate caches: File → Invalidate Caches and Restart

**Build Failed:**
- Clean project: Build → Clean Project
- Rebuild: Build → Rebuild Project
- Check SDK versions in build.gradle

**APK Not Installing:**
- Enable "Install unknown apps" on device
- Check APK signature
- Try debug APK first

**App Crashes:**
- Check device logs: `adb logcat`
- Test on emulator first
- Verify all assets are copied to www/

### Support Files Created
- `build-android-studio.bat` - Copies files and shows instructions
- `build-android-simple.bat` - Command line build (requires Gradle)
- `platforms/android/` - Complete Android Studio project
- `www/` - Web app files for mobile

## 📋 App Information
- **Package Name**: com.wynmanagement.app
- **Version**: 1.0.0
- **Min SDK**: 22 (Android 5.1)
- **Target SDK**: 34 (Android 14)
- **Permissions**: Internet, Network State

## 🎯 Next Steps
1. Build and test the debug APK
2. Create app store assets (icons, screenshots)
3. Set up developer accounts
4. Generate signed release APK
5. Submit to app stores

For technical support, refer to the main README.md or contact the development team.
