import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/UI/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jt_leave_app/logic/auth/activation_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


// final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('employees').snapshots();

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty){
      await Firebase.initializeApp(
        name: "JTLeaveImportTesting",
        options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firebase.app();
  }

  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: "juliandevss@gmail.com", password: "Pwd123");
  }
  on FirebaseAuthException catch (e){
    log('This is why: $e');
  }
  
  runApp(ProviderScope(child: const MainApp()));
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: kthemeScheme,
      darkTheme: kDarkThemeScheme,
      themeMode: ThemeMode.light,
      home: const ActivateScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
