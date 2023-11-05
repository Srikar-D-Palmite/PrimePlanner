import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCTkdk5VlATpgUnA1Kt2nEuqYF5xUZyokQ",
            authDomain: "prime-planner.firebaseapp.com",
            projectId: "prime-planner",
            storageBucket: "prime-planner.appspot.com",
            messagingSenderId: "305899752673",
            appId: "1:305899752673:web:367dce404073bf4764bba0",
            measurementId: "G-8XXME8H6NP"));
  } else {
    await Firebase.initializeApp();
  }
}
