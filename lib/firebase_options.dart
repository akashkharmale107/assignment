// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsKzz7cxVUWOgT3t0NyuJi6dYRScgF0E8',
    appId: '1:288054575568:android:ab28ce6a10cdc7b31e39d5',
    messagingSenderId: '288054575568',
    projectId: 'akashassignment',
    storageBucket: 'akashassignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCN2bmqRRpS4tg_Z-r4J9U94WW38QBGRl0',
    appId: '1:288054575568:ios:44fe5cdd7bf5f4cd1e39d5',
    messagingSenderId: '288054575568',
    projectId: 'akashassignment',
    storageBucket: 'akashassignment.appspot.com',
    androidClientId: '288054575568-7d7kpa49ise5ci9833ctlsq4tf0sv21s.apps.googleusercontent.com',
    iosClientId: '288054575568-9u3423bnuo1mt04dq5f2c8e2e82movh5.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment',
  );
}
