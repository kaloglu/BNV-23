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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDwp_ZBtQ_10q5VFL77Larl704cHeNOSNM',
    appId: '1:414030755976:web:29565eb8d73ab6b2db473d',
    messagingSenderId: '414030755976',
    projectId: 'bedavanevar-2019',
    authDomain: 'bedavanevar-2019.firebaseapp.com',
    databaseURL: 'https://bedavanevar-2019.firebaseio.com',
    storageBucket: 'bedavanevar-2019.appspot.com',
    measurementId: 'G-EX20Z8DEQZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0o4oEtRuaNYgaLD8xyNN1shmmDZ9-3rY',
    appId: '1:414030755976:android:3c7d3fdb10c13056db473d',
    messagingSenderId: '414030755976',
    projectId: 'bedavanevar-2019',
    databaseURL: 'https://bedavanevar-2019.firebaseio.com',
    storageBucket: 'bedavanevar-2019.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCek-GYYKmxEk6gsKm09UnBfIjxcoZkpOA',
    appId: '1:414030755976:ios:4e1f36c41279c9cbdb473d',
    messagingSenderId: '414030755976',
    projectId: 'bedavanevar-2019',
    databaseURL: 'https://bedavanevar-2019.firebaseio.com',
    storageBucket: 'bedavanevar-2019.appspot.com',
    androidClientId: '414030755976-090mhmg7jlbb9uvs9da41otbr7k6ug6g.apps.googleusercontent.com',
    iosClientId: '414030755976-hnijosttmhj5a15geg2ms6vpiedbhnde.apps.googleusercontent.com',
    iosBundleId: 'com.kaloglu.bedavanevar',
  );
}
