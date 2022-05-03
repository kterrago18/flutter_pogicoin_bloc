import 'package:flutter/material.dart';

import 'ui/screens/coin_list_screen.dart';

void main() {
  runApp(const CoinPogiApp());
}

class CoinPogiApp extends StatelessWidget {
  const CoinPogiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CoinListScreen(),
    );
  }
}
