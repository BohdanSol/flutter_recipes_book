import 'package:flutter/material.dart';
import '../services/cat_fact_service.dart';

class CatFactScreen extends StatefulWidget {
  const CatFactScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CatFactScreenState createState() => _CatFactScreenState();
}

class _CatFactScreenState extends State<CatFactScreen> {
  String? fact;
  final CatFactService _catFactService = CatFactService();

  Future<void> fetchCatFact() async {
    try {
      final fetchedFact = await _catFactService.fetchCatFact();
      setState(() {
        fact = fetchedFact;
      });
    } catch (e) {
      setState(() {
        fact = 'Failed to load fact';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCatFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Fact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (fact != null)
              Text(
                fact!,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchCatFact,
              child: const Text('Get Another Fact'),
            ),
          ],
        ),
      ),
    );
  }
}
