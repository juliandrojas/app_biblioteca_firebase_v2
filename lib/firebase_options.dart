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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC6R7oDAzOy3G2vH9kHGG3dmrxohxC8wHo',
    appId: '1:132040772743:web:ffc9c98ae8554c2ba57c22',
    messagingSenderId: '132040772743',
    projectId: 'app-biblioteca-flutter',
    authDomain: 'app-biblioteca-flutter.firebaseapp.com',
    storageBucket: 'app-biblioteca-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVIq_Cx0HpQSFvm-FKLGpZ0NF9Zbb2J5E',
    appId: '1:132040772743:android:bb610f8ab8dce1d6a57c22',
    messagingSenderId: '132040772743',
    projectId: 'app-biblioteca-flutter',
    storageBucket: 'app-biblioteca-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsox-DVxL-YhIiQqLeM9kSfyZ_ig7suRk',
    appId: '1:132040772743:ios:a8369fd76f111737a57c22',
    messagingSenderId: '132040772743',
    projectId: 'app-biblioteca-flutter',
    storageBucket: 'app-biblioteca-flutter.appspot.com',
    iosClientId:
        '132040772743-u3soma7gplreqhml6iolb2u8asm6r1h9.apps.googleusercontent.com',
    iosBundleId: 'com.example.appBibliotecaFirebaseV2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsox-DVxL-YhIiQqLeM9kSfyZ_ig7suRk',
    appId: '1:132040772743:ios:a8369fd76f111737a57c22',
    messagingSenderId: '132040772743',
    projectId: 'app-biblioteca-flutter',
    storageBucket: 'app-biblioteca-flutter.appspot.com',
    iosClientId:
        '132040772743-u3soma7gplreqhml6iolb2u8asm6r1h9.apps.googleusercontent.com',
    iosBundleId: 'com.example.appBibliotecaFirebaseV2',
  );
}
