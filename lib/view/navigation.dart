import 'package:currency_convertor/view/default_screen.dart';
import 'package:currency_convertor/view/favorite_screen.dart';
import 'package:currency_convertor/view/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CurrencyScreen(),
    Default(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, // Background color of app bar
        title: const Text(
          'Currency Converter',
          textAlign: TextAlign.center, // Align the text to the center
        ),
        centerTitle: true, // Center the title
        elevation: 0, // Remove app bar shadow
      ),
      body: Container(
        color: Colors.grey[200], // Background color of the body
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey, // Background color of bottom navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined), // Change the icon
            label: 'Convert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), // Change the icon
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Change the icon
            label: 'Defaults',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
