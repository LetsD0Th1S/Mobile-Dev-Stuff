import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:jt_leave_app/UI/theme/app_theme.dart';
import 'package:jt_leave_app/logic/auth/activation_screen.dart';
import 'package:jt_leave_app/models/history_item.dart';
import 'package:jt_leave_app/providers/isar_providers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late Isar isar;

// final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('employees').snapshots();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: 'https://hwzvjzpfoeliwtgekbtj.supabase.co',
      anonKey: 'sb_publishable_pu86-Z2TaYZY2vLAXF2k4w_xBHBxQ9n',
    );
  } catch (e) {
    dev.log('Could not initialize: $e');
  }

  final dir = await getApplicationDocumentsDirectory();

  isar = await Isar.open([HistoryItemSchema], directory: dir.path);

  runApp(
    ProviderScope(
      overrides: [isarProvider.overrideWithValue(isar)],
      child: const MainApp(),
    ),
  );
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
