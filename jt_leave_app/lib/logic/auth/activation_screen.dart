import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/UI/screens/tabs.dart';
import 'package:jt_leave_app/providers/firebase_stream_provider.dart';

class ActivateScreen extends ConsumerWidget {
  const ActivateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activateCodeProvider);
    String? code;

    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: .circular(15),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              const Text("please enter your employee number below:"),
              TextField(
                onChanged: (r) {
                  code = r;
                },
              ),
              ElevatedButton(
                onPressed: (() async {
                  if (code!.isEmpty || code == "") {
                    await showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .center,
                          children: [
                            Padding(
                              padding: const .all(8.0),
                              child: const Text(
                                'Invalid employee number. Please try again.',
                                textAlign: .center,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      ),
                    );
                    return;
                  }
                  ref.read(activateCodeProvider.notifier).code(code!);
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => TabsScreen()));
                }),
                child: const Text("Submit Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
