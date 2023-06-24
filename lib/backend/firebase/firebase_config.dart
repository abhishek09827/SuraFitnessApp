import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCag0MERJnvg-c-U0Cyw0rp_IV5XWq4DGo",
            authDomain: "surafitness-4fe71.firebaseapp.com",
            projectId: "surafitness-4fe71",
            storageBucket: "surafitness-4fe71.appspot.com",
            messagingSenderId: "870764610888",
            appId: "1:870764610888:web:bcc27b7f70e28a9d925f7d",
            measurementId: "G-BYDLBT7EJZ"));
  } else {
    await Firebase.initializeApp();
  }
}
