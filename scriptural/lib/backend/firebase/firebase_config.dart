import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBWoilmgTOyE95vvRi_yZpT4fhCOXHqVqA",
            authDomain: "scriptural-vzafn4.firebaseapp.com",
            projectId: "scriptural-vzafn4",
            storageBucket: "scriptural-vzafn4.appspot.com",
            messagingSenderId: "770115035097",
            appId: "1:770115035097:web:eeaf34fb7877b8ef5783c8"));
  } else {
    await Firebase.initializeApp();
  }
}
