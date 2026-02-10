import 'package:budget_tracking_app/features/feature1/UI/logic/income_list_providers.dart';
import 'package:budget_tracking_app/features/feature1/UI/widgets/income_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeScreen extends ConsumerWidget {
  const IncomeScreen({super.key});

  //   @override
  //   State<IncomeScreen> createState() => __IncomeScreenState();
  // }

  // class __IncomeScreenState extends State<IncomeScreen> {
  //   // TextEditingController nameControls = TextEditingController();
  //   // TextEditingController valueControls = TextEditingController();
  //   List<TextEditingController> nameControls = [];
  //   List<TextEditingController> valueControls = [];

  //   void _onComplete(){
  //     print("Done");
  //   }

  //   void _onDelete(int index){
  //     setState(() {
  //       items.removeAt(index);
  //       nameControls.removeAt(index);
  //       valueControls.removeAt(index);
  //     });
  //   }

  //   @override
  //   void initState() {
  //     super.initState();
  //   }

  //   @override
  //   void dispose(){
  //     super.dispose();
  //     for (var control in valueControls){
  //       control.dispose();
  //     }
  //   }

  //   List<Widget> items = [
  //   ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(incomeProvider);
    final total = ref.watch(totalIncomeProvider);

    return Column(
      children: [
        const Text("Please add your income below:", textAlign: .center),
        const SizedBox(height: 8),

        Expanded(
          child: ListView.builder(
            itemCount: items.length + 1 , // + 1 for the add button :)
            itemBuilder: (context, index) {
              if (index == items.length){
                return Center(
                    child: ElevatedButton(
                      onPressed: () => ref.read(incomeProvider.notifier).add(),
                      child: const Text('Add Income'),
                  ),
                );
              }
          
              final item = items[index];

              return IncomeCard(
                item: item,
                onNameChanged: (n) =>
                    ref.read(incomeProvider.notifier).updateName(index, n),
                onValueChanged: (v) =>
                    ref.read(incomeProvider.notifier).updateValue(index, double.parse(v)),
                onFilterChanged: (f) =>
                    ref.read(incomeProvider.notifier).updateFilter(index, f),
                onDelete: () => ref.read(incomeProvider.notifier).remove(index),
              );
            },
          ),
        ),
        SafeArea(
          child: Container(
            padding: .only(right: 80),
            width: double.infinity,
            height: 30,
            color: Colors.deepPurpleAccent,
            child: Text('Total Income: R ${total.toStringAsFixed(2)}', textAlign: .end,)),
        )
      ],
    );
  }
}
