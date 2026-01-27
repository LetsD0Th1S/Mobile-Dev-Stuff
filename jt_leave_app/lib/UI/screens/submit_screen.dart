import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {

  var formatter = DateFormat('yyyy-MM-dd');

  DateTime? _startDate;
  DateTime? _endDate;

  Future _SubmitStartDatePicker() async {
    var currentDate = DateTime.now();
    var endDate = DateTime(currentDate.year + 1);
    final DateTime? _selectedDate = await showDatePicker(
      context: context, 
      firstDate: currentDate, 
      lastDate: endDate, 
      helpText: 'Leave Start Date');

      setState(() {
        _startDate = _selectedDate;
      });
  }

  Future _SubmitEndDatePicker() async {
    var currentDate = DateTime.now();
    var endDate = DateTime(currentDate.year + 1);
    final DateTime? _selectedDate = await showDatePicker(
      context: context, 
      firstDate: currentDate, 
      lastDate: endDate, 
      helpText: 'Leave Start Date');

      setState(() {
        _endDate = _selectedDate;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            const Text('Leave to submit:',),
            SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownMenu(
                    width: 200,
                    label: const Text('Leave Type'),
                    initialSelection: 'Annual',
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 210, 209, 210)),
                    ),
                    dropdownMenuEntries: 
                  [
                    DropdownMenuEntry(value: ValueKey, label: 'Annual'),
                    DropdownMenuEntry(value: ValueKey, label: 'Sick Paid'),
                    DropdownMenuEntry(value: ValueKey, label: 'Maternity'),
                  ]),
                  
                ],
              ),
              SizedBox(height: 20,),
              Row(children: [
                IconButton(onPressed: _SubmitStartDatePicker, icon: Icon(Icons.calendar_month)),
                if (_startDate != null)
              Text(formatter.format(_startDate!))
              else
              Text('No start date selected yet.'),
              ],),
              Row(children: [
                IconButton(onPressed: _SubmitEndDatePicker, icon: Icon(Icons.calendar_month)),
                if (_endDate != null)
              Text(formatter.format(_endDate!))
              else
              Text('No start date selected yet.'),
              ],),
              if (_endDate != null && _startDate != null)
              Text('Number of days: ${(_endDate!.difference(_startDate!).inDays)+1}'),
              ElevatedButton(onPressed: (){}, child: const Text('Submit', style: TextStyle(fontSize: 20),),),
                
          ],
        ),
      ),
    );
  }
}