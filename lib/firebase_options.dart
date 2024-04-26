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
        return windows;
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
    apiKey: 'AIzaSyB6uJhLUbF2uFWK8dkvFXLF1-CCzF3RQUw',
    appId: '1:439689006882:web:865134bd9bd9f2812b5f7b',
    messagingSenderId: '439689006882',
    projectId: 'frontiers-market-interview',
    authDomain: 'frontiers-market-interview.firebaseapp.com',
    storageBucket: 'frontiers-market-interview.appspot.com',
    measurementId: 'G-30HSC6V0KM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeJFDYY6JdNlTMw27jI_zTkhA5XWrP21g',
    appId: '1:439689006882:android:ccce1a182984a3e72b5f7b',
    messagingSenderId: '439689006882',
    projectId: 'frontiers-market-interview',
    storageBucket: 'frontiers-market-interview.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNpPk2pUQOFiLB99Qzszc9OZ1BZjNcfHM',
    appId: '1:439689006882:ios:c649a2391e3da18b2b5f7b',
    messagingSenderId: '439689006882',
    projectId: 'frontiers-market-interview',
    storageBucket: 'frontiers-market-interview.appspot.com',
    iosBundleId: 'com.example.frontiersMarketInterview',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNpPk2pUQOFiLB99Qzszc9OZ1BZjNcfHM',
    appId: '1:439689006882:ios:c649a2391e3da18b2b5f7b',
    messagingSenderId: '439689006882',
    projectId: 'frontiers-market-interview',
    storageBucket: 'frontiers-market-interview.appspot.com',
    iosBundleId: 'com.example.frontiersMarketInterview',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB6uJhLUbF2uFWK8dkvFXLF1-CCzF3RQUw',
    appId: '1:439689006882:web:c287884b482452542b5f7b',
    messagingSenderId: '439689006882',
    projectId: 'frontiers-market-interview',
    authDomain: 'frontiers-market-interview.firebaseapp.com',
    storageBucket: 'frontiers-market-interview.appspot.com',
    measurementId: 'G-Z6MQ6MEV1E',
  );

}