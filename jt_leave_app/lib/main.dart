import 'dart:developer' as dev;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:jt_leave_app/UI/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jt_leave_app/logic/auth/activation_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';



// final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('employees').snapshots();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty){
      await Firebase.initializeApp(
        name: "JTLeaveImportTesting",
        options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firebase.app();
  }
  // Firebase authentication attempt => try-catch
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: "juliandevss@gmail.com", password: "Pwd123");
  }
  on FirebaseAuthException catch (e){
    dev.log('Cannot authorize access to firebase because: $e');
  }

  // Hive Initialization
  await Hive.initFlutter();

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
