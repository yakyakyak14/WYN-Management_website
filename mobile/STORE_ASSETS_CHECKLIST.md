# WYN Management • Store Assets Checklist

Use this checklist to prepare all visual and compliance assets for Google Play and Apple App Store submissions.

## 1) App Icons

- [ ] Source icon (master): 1024×1024 PNG (no rounded corners, no alpha for iOS store icon)
  - Location suggestion: `mobile/res/icon.png`
  - Tip: Keep background high contrast; prefer vector source (SVG/AI) exported to PNG
- [ ] Android adaptive icon (generated via cordova-res)
  - Command (run from `mobile/`):
    ```bash
    cordova-res android --skip-config --copy
    ```
  - Output: `platforms/android/app/src/main/res/mipmap-*/ic_launcher.*`
- [ ] iOS app icons (generated via cordova-res)
  - Command (run from `mobile/` on macOS):
    ```bash
    cordova-res ios --skip-config --copy
    ```
  - Output: iOS Asset Catalog AppIcon

## 2) Google Play Store Graphics

- [ ] Store icon: 512×512 PNG, < 1 MB
- [ ] Feature graphic: 1024×500 PNG/JPG
- [ ] Screenshots (min 2 for Phone):
  - Phone (portrait): 1080×1920 or larger (2–8 images)
  - 7" Tablet (portrait): 1200×1920 or larger (optional)
  - 10" Tablet (portrait): 1600×2560 or larger (optional)
- [ ] Optional: Promo video (YouTube URL)

## 3) Apple App Store Graphics

- [ ] App Store Icon: 1024×1024 PNG (no alpha)
- [ ] Screenshots per device family (at least 3–5 each recommended):
  - 6.7" iPhone: 1290×2796
  - 6.5" iPhone: 1242×2688
  - 5.5" iPhone: 1242×2208
  - iPad Pro 12.9": 2048×2732

## 4) Text Content

- [ ] App Name: WYN Management
- [ ] Short Description (Play): ~80 chars
  - e.g., "Elite talent management: scouting, refining, branding, publicity."
- [ ] Full Description (Play): 400–4000 chars
- [ ] Subtitle (iOS): up to 30 chars
- [ ] Description (iOS): detailed, similar to Play full description
- [ ] Keywords (iOS): comma-separated
- [ ] Support URL & Marketing URL (iOS):
  - Marketing: https://wynmanagement.com/
  - Support: https://wynmanagement.com/pages/contact.html
- [ ] Privacy Policy URL:
  - https://wynmanagement.com/pages/privacy.html

## 5) Compliance & Forms

- [ ] Privacy Policy page published
  - Repo: `pages/privacy.html` (already created)
- [ ] Data safety (Play Console): review collection/usage
- [ ] Content rating questionnaire (Play)
- [ ] Age rating (iOS)
- [ ] Encryption export compliance (iOS) — usually "No" if no custom crypto

## 6) Keystore / Signing (Android)

Create a secure release keystore and keep the file and passwords private. Do NOT commit to git.

- Suggested alias: `wynmgtwebsite`
- Generate (Command Prompt or PowerShell):
  ```bash
  keytool -genkey -v -keystore wyn-management-release-key.jks -alias wynmgtwebsite -keyalg RSA -keysize 2048 -validity 10000
  ```
  You will be prompted for:
  - First/Last Name: Hope Ukpai
  - Organizational Unit (OU): WYN Tech
  - Organization (O): WYN
  - City (L): Abuja
  - State (ST): Federal Capital Territory
  - Country Code (C): NG
  - Key password: (ENTER SECURELY; store in a password manager)

- Sign and align (example):
  ```bash
  # From: mobile/platforms/android/app/build/outputs/apk/release
  jarsigner -verbose -keystore path\to\wyn-management-release-key.jks app-release-unsigned.apk wynmgtwebsite
  zipalign -v 4 app-release-unsigned.apk WYN-Management.apk
  ```

- Play Console prefers AAB:
  In Android Studio: Build > Generate Signed Bundle / APK > Android App Bundle (AAB)

## 7) In-App Screens to Capture (recommended list)

- [ ] Home (hero/branding)
- [ ] Talents overview grid
- [ ] Individual talent (e.g., Jacob Njoku / Oscar Onyeka)
- [ ] Contact / menu navigation
- [ ] Any updates/announcements section

## 8) QA Checklist

- [ ] App opens offline (graceful fallback)
- [ ] Links open inside WebView or via external browser as intended
- [ ] Layouts responsive on phone & tablet
- [ ] Dark theme contrast meets accessibility
- [ ] Icons and splash look sharp on all densities

## 9) Submission Notes

- Keep the keystore `.jks` file and passwords backed up securely.
- Double-check package IDs:
  - Android: `com.wynmanagement.app`
  - iOS Bundle ID: `com.wynmanagement.app`
- Ensure version codes increment each release (Android) and build numbers increment (iOS).
