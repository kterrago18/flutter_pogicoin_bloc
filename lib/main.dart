import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/coin_repository.dart';
import 'ui/screens/coin_list_screen.dart';

void main() {
  runApp(const CoinPogiApp());
}

class CoinPogiApp extends StatelessWidget {
  const CoinPogiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CoinRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CoinListScreen(),
      ),
    );
  }
}
