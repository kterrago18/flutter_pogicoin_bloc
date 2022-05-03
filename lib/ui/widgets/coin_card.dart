import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard(
      {Key? key,
      required this.coinName,
      required this.symbol,
      required this.coinImageUrl})
      : super(key: key);

  final String coinName;
  final String symbol;
  final String coinImageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: _buildCircleAvatar(coinImageUrl),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coinName),
                  Text(symbol),
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

  Container _buildCircleAvatar(String coinImageUrl) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          'https://cryptocurrencyliveprices.com/img/$coinImageUrl.png',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const Center(child: CircularProgressIndicator());
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Text('Some errors occurred!'),
        ),
      ),
    );
  }
}
