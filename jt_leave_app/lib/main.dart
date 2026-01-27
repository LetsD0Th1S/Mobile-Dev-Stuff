import 'package:flutter/material.dart';
import 'package:jt_leave_app/UI/screens/history_screen.dart';
import 'package:jt_leave_app/UI/screens/home_screen.dart';
import 'package:jt_leave_app/UI/screens/submit_screen.dart';
import 'package:jt_leave_app/UI/widgets/menu_drawer.dart';

void main() {
  runApp(const MainApp());
}



// Light mode them variable ----------------------------------------
var kthemeScheme = ThemeData().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: Colors.grey,
    elevation: 1.0,
    shadowColor: Colors.black,
    labelTextStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white)),
    iconTheme: WidgetStatePropertyAll(const IconThemeData().copyWith(color: Colors.white)),
  ),
  appBarTheme: AppBarThemeData().copyWith(
    backgroundColor: const Color.fromARGB(255, 247, 247, 176),
    shadowColor: Colors.black,
    elevation: 4.0 // Adds shadow elevation ; must be greater than 0
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.green),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      )
  ),
  textTheme: TextTheme().copyWith(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: Colors.black,
    ),
    bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
  ),
);

// Dark mode theme varialble ---------------------------------------
var kDarkThemeScheme = ThemeData().copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 55, 55, 55),
  appBarTheme: AppBarThemeData().copyWith(
    backgroundColor: const Color.fromARGB(198, 239, 239, 167),
    shadowColor: Colors.black,
  ),
  textTheme: TextTheme().copyWith(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: Colors.black,
    ),
  ),
);

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  static const screensList = [
    SubmitScreen(),
    HomeScreen(),
    HistoryScreen(),
  ];
  var _selectedIndex = 1;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: kthemeScheme,
      darkTheme: kDarkThemeScheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
        title: Center(
          child: _selectedIndex == 0 ? const Text('Submit Leave') 
          : _selectedIndex == 1 ? const Text('Leave Balances') 
          : const Text('History'),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: () {
              Scaffold.of(context).openDrawer();
            }, icon: Icon(Icons.menu));
          }
        ),
        
      ),
      drawer: MenuDrawer(),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int value) => setState(() => _selectedIndex = value),
          selectedIndex: _selectedIndex,
          indicatorColor: Colors.transparent,
          indicatorShape: Border(bottom: BorderSide(color: Colors.blueGrey, width: 3)),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.add_outlined), label: 'Submit', selectedIcon: Icon(Icons.add), ),
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home', selectedIcon: Icon(Icons.home)),
            NavigationDestination(icon: Icon(Icons.history_outlined), label: 'History', selectedIcon: Icon(Icons.history)),
            ],
          ),
        body: screensList[_selectedIndex],
      ),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
