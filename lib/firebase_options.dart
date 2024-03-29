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
    apiKey: 'AIzaSyB3AU8o0BVvI6j2E9eOrRsNstk_DiIVv3g',
    appId: '1:642006970123:web:4368eef67d49634328bc0e',
    messagingSenderId: '642006970123',
    projectId: 'portal-410523',
    authDomain: 'portal-410523.firebaseapp.com',
    storageBucket: 'portal-410523.appspot.com',
    measurementId: 'G-M84C8DQMFG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpPK5LE6sTF-XWEVggz5cl9zNO6Kgc5W0',
    appId: '1:642006970123:android:185e2e399e7abcba28bc0e',
    messagingSenderId: '642006970123',
    projectId: 'portal-410523',
    storageBucket: 'portal-410523.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC12XR94f2TA15fhmqhWiu9cIvn_DkZwfM',
    appId: '1:642006970123:ios:e424bfce5b5d29e028bc0e',
    messagingSenderId: '642006970123',
    projectId: 'portal-410523',
    storageBucket: 'portal-410523.appspot.com',
    iosBundleId: 'cc.blackmatter.portal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC12XR94f2TA15fhmqhWiu9cIvn_DkZwfM',
    appId: '1:642006970123:ios:d60b072522c1e0f928bc0e',
    messagingSenderId: '642006970123',
    projectId: 'portal-410523',
    storageBucket: 'portal-410523.appspot.com',
    iosBundleId: 'com.example.portal.RunnerTests',
  );
}
