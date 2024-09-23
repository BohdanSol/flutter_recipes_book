import 'package:flutter/material.dart';
import 'package:flutter_recioes_book/services/currency_service.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final _currencyService = CurrencyService();
  final TextEditingController _amountController = TextEditingController();
  double? exchangeRate;
  String? result;

  @override
  void initState() {
    super.initState();
    _fetchExchangeRate();
  }

  Future<void> _fetchExchangeRate() async {
    try {
      final rate = await _currencyService.fetchExchangeRate();
      setState(() {
        exchangeRate = rate;
      });
    } catch (e) {
      setState(() {
        result = 'Failed to load exchange rate';
      });
    }
  }

  void _convertCurrency() {
    if (exchangeRate != null && _amountController.text.isNotEmpty) {
      final amount = double.tryParse(_amountController.text);
      if (amount != null) {
        final convertedValue = amount * exchangeRate!;
        setState(() {
          result = '$amount USD = ${convertedValue.toStringAsFixed(2)} UAH';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter amount in USD',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _convertCurrency();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            if (result != null)
              Text(
                result!,
                style: const TextStyle(fontSize: 18),
              )
            else if (exchangeRate == null)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
