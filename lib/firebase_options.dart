// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDEF4fxVMo4K0UZWJtaR9IQ926jkkjw3Zw',
    appId: '1:722669490799:android:805ed94358338586ad739a',
    messagingSenderId: '722669490799',
    projectId: 'healthcare-app-25987',
    databaseURL: 'https://healthcare-app-25987-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'healthcare-app-25987.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsXFfTQOiUnRVdr9m4FUm9CrY2orZQ7h0',
    appId: '1:722669490799:ios:a61ea9db1b0ad3fead739a',
    messagingSenderId: '722669490799',
    projectId: 'healthcare-app-25987',
    databaseURL: 'https://healthcare-app-25987-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'healthcare-app-25987.appspot.com',
    iosBundleId: 'com.example.healthCareEx',
  );
}
