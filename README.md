# Parker
Social based parking application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Parker

## Environment Configuration
Follow the installation tutorial: https://flutter.dev/docs/get-started/install

Run in the project folder the next command: `flutter doctor`.

## Project Setup
If the configuration in the **flutter doctor** is okay, run the following commands:

1. `flutter pub get` - It downloads the dependencies
2. `flutter pub run build_runner build` - this command will generate some model and service file in the project. You must run this command each time before the build.

## Run
#### Android
1. *[Enable usb debugging](https://www.embarcadero.com/starthere/xe5/mobdevsetup/android/en/enabling_usb_debugging_on_an_android_device.html)*
2. Connect your phone to the PC/Mac.
3. Run the command `flutter run`

## Build
0. Increase the build and version number in the pubspec.yaml file. (Format: x.x.x+y - x: version, first x- main version, 2nd x- small feature update, 3th x - bugfix ; y: build number
1. Clear project: `flutter clean`
2. Download the dependencies: `flutter pub get`
3. Model and service generation: `flutter pub run build_runner build`

### Android AKP and AppBundle build and release
4. Run the command `flutter build apk --release` or `flutter build appbundle --release` (Local production testing -> apk, store release -> appbundle)
5. Go to the PlayStore Console application page *[Parker APP](https://play.google.com/console/u/0/developers/{organizationId}/app/{appId}/app-dashboard?timespan=thirtyDays)*
6. Choose the environment in the left side menu: Production, OpenTesting, ClosedTesting, Internal Testing, ...
7. Click on the Edit Release od Create new Release button (top right corner)
8. Upload the generated file (App bundle section) and write a release note.
10. Rollout
11. Done!!!

### iOS Release (macOs only and if your user is registered to the application profile (*[AppStoreConnect](https://appstoreconnect.apple.com/)*) )
*If you need a keystore or certificate file: parker/keystore folder*

4. Open the project in xcode
5. Open the base Runner file
6. On the General tab increase the version and build number
7. Header -> Product -> Archive (if a pod install error occurs, run the `pod install` command in the parker/ios folder)
8. Open the organizer (Header -> Window -> Organizer)
9. Select the last build -> Distribute App -> Next -> Ok -> Default values -> ... -> Next -> .... -> Publish...)
10. Open the AppStore connect page: *[AppPage](https://appstoreconnect.apple.com/apps/{numbers}/appstore)*
11. In the right corner (iOS App) create a new version.
12. Write a release note
13. Select the uploaded version
14. Save -> Submit
15. Done!!!
ƒ
## Application Icon generation
App Icon files: /resources/icons
`flutter pub run flutter_launcher_icons:main`
