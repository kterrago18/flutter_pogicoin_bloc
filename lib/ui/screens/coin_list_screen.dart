import 'package:flutter/material.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoinPogi'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ...List<Widget>.generate(
                  30,
                  (index) => const CoinCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FlutterLogo(),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bitcoin'),
                  Text('BTC'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('USD 20202022.22'),
                  Text('+ 5.23'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
