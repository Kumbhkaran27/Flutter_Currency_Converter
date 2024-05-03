import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  List<String> favoriteCurrencies = []; // Maintain the list of favorites here
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Currencies'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Enter currency code',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      favoriteCurrencies.add(_textFieldController.text);
                      _textFieldController.clear();
                    });
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: favoriteCurrencies.isEmpty
                ? const Center(
                    child: Text(
                      'No favorite currencies added yet!',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteCurrencies.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(favoriteCurrencies[index]),
                        // Customize the tile with icons, buttons, etc.
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
