import 'package:currency_convertor/View/Widgets/dropdown_row.dart';
import 'package:currency_convertor/utils/utils.dart';
import 'package:flutter/material.dart';

class FavCard extends StatefulWidget {
  final rates;
  final Map currencies;
  const FavCard(
      {super.key,
      @required this.rates,
      required this.currencies,
      required String targetCurrency,
      required String defaultCurrency,
      required Future<void> Function(String currency) onSaveDefaultCurrency});

  @override
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  String dropdownValue1 = 'USD';
  String dropdownValue2 = 'INR';
  String conversion = '';
  bool isLoading = false;

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void convertAndDisplay() {
    conversion =
        '${amountController.text} $dropdownValue1 = ${Utils.convert(widget.rates, amountController.text, dropdownValue1, dropdownValue2)} $dropdownValue2';
    stopLoading();
  }

  void swapCurrencies() {
    setState(() {
      String temp = dropdownValue1;
      dropdownValue1 = dropdownValue2;
      dropdownValue2 = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          DropdownRow(
            label: 'From:',
            value: dropdownValue1,
            currencies: widget.currencies,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue1 = newValue!;
              });
            },
          ),
          DropdownRow(
            label: 'To:',
            value: dropdownValue2,
            currencies: widget.currencies,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue2 = newValue!;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (formFieldKey.currentState!.validate()) {
                      startLoading();
                      conversion = '';
                      convertAndDisplay();
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Save Defaults'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            conversion,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Text('Currency Rates from https://openexchangerates.org'),
        ],
      ),
    );
  }
}
