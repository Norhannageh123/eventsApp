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
    apiKey: 'AIzaSyAlyM-y2KnloPvx3S9vS_A1gcAvO3WLIbo',
    appId: '1:289940437688:web:bf39004e8f88ec2e54d24d',
    messagingSenderId: '289940437688',
    projectId: 'eventapp-9bc14',
    authDomain: 'eventapp-9bc14.firebaseapp.com',
    storageBucket: 'eventapp-9bc14.firebasestorage.app',
    measurementId: 'G-T8R2N5L65H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGEO4CyCOYx9i2sNYOOk68c5wwhVC6QAE',
    appId: '1:289940437688:android:6a6d413402a3880c54d24d',
    messagingSenderId: '289940437688',
    projectId: 'eventapp-9bc14',
    storageBucket: 'eventapp-9bc14.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVZ2qqVN1yYItorzkeZ6_9YxkkGXe6A14',
    appId: '1:289940437688:ios:17cbfc228aec1ce954d24d',
    messagingSenderId: '289940437688',
    projectId: 'eventapp-9bc14',
    storageBucket: 'eventapp-9bc14.firebasestorage.app',
    iosBundleId: 'com.example.eventlyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVZ2qqVN1yYItorzkeZ6_9YxkkGXe6A14',
    appId: '1:289940437688:ios:17cbfc228aec1ce954d24d',
    messagingSenderId: '289940437688',
    projectId: 'eventapp-9bc14',
    storageBucket: 'eventapp-9bc14.firebasestorage.app',
    iosBundleId: 'com.example.eventlyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAlyM-y2KnloPvx3S9vS_A1gcAvO3WLIbo',
    appId: '1:289940437688:web:e2ad2eb2dc729ca154d24d',
    messagingSenderId: '289940437688',
    projectId: 'eventapp-9bc14',
    authDomain: 'eventapp-9bc14.firebaseapp.com',
    storageBucket: 'eventapp-9bc14.firebasestorage.app',
    measurementId: 'G-4MMQT4Y1FK',
  );
}
