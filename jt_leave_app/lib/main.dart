import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/ui/core/theme/app_theme.dart';
import 'package:jt_leave_app/ui/core/theme/theme_change_provider.dart';
import 'package:jt_leave_app/data/auth/activation_screen.dart';
import 'package:jt_leave_app/ui/history_results/models/history_item.dart';
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

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeChangeProvider);
    return MaterialApp(
      theme: kthemeScheme,
      darkTheme: kDarkThemeScheme,
      themeMode: theme == false ? ThemeMode.light : ThemeMode.dark,
      home: const ActivateScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
