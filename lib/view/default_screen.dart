import 'package:currency_convertor/Model/rates_model.dart';
import 'package:currency_convertor/data/network/api_services.dart';
import 'package:currency_convertor/view/widgets/fav.dart';
import 'package:flutter/material.dart';

class Default extends StatefulWidget {
  const Default({Key? key}) : super(key: key);

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  late Future<RatesModel> ratesModel;
  late Future<Map> currenciesModel;
  String baseCurrency = 'USD'; // Example default base currency
  String targetCurrency = 'EUR'; // Example default target currency

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    ratesModel = fetchRates();
    currenciesModel = fetchCurrencies();
  }

  // Function to update default currencies
  Future<void> _updateDefaultCurrencies(String newBaseCurrency) async {
    setState(() {
      baseCurrency = newBaseCurrency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<RatesModel>(
        future: ratesModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder<Map>(
              future: currenciesModel,
              builder: (context, index) {
                if (index.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (index.hasError) {
                  return Center(child: Text('Error: ${index.error}'));
                } else {
                  return FavCard(
                    rates: snapshot.data!.rates,
                    currencies: index.data!,
                    defaultCurrency: baseCurrency,
                    targetCurrency: targetCurrency,
                    onSaveDefaultCurrency: _updateDefaultCurrencies,
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
