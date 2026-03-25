import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/api_submit_provider.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/ui/core/theme/theme_change_provider.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeChanged = ref.watch(themeChangeProvider);
    return Drawer(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.heightOf(context) / 7,
            decoration: BoxDecoration(
              borderRadius: .only(bottomRight: .circular(15)),
              color: .fromARGB(100, 100, 100, 100),
            ),
            child: Padding(
              padding: .all(18),
              child: Row(
                children: [
                  Container(
                    margin: .all(2),
                    child: Image.asset(
                      height: 10,
                      width: 10,
                      'lib/utils/images/jt_leave_icon_test.png',
                      fit: .fitHeight,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('JT Leave App'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 14),
              const Text('Dark Mode'),
              const SizedBox(width: 10),
              Switch(
                value: themeChanged,
                onChanged: (value) =>
                    ref.read(themeChangeProvider.notifier).toggle(value),
              ),
            ],
          ),
          TextButton(onPressed: () {}, child: const Text('Check Audit')),
          TextButton(
            onPressed: () {
              ref.read(historyRemoveProvider);
              ref.read(submitAPIProvider.notifier).removeAll();
            },
            child: const Text('Clear History'),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: .center,
            children: const [
              Text('Powered by Jarrison Systems'),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
