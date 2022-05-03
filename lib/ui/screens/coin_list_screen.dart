import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pogicoin_bloc/data/repository/coin_repository.dart';

import '../../blocs/coin_list/coin_list_bloc.dart';
import '../widgets/widgets.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoinListBloc(coinRepository: context.read<CoinRepository>())
            ..add(LoadCoins()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CoinPogi'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CoinListBloc, CoinListState>(
                builder: (context, state) {
                  if (state is CoinListLoading) {
                    return CircularProgressIndicator();
                  }

                  if (state is CoinListLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.coinList.length,
                        itemBuilder: ((context, index) {
                          return CoinCard(
                            coinName: state.coinList[index].name!,
                            symbol: state.coinList[index].symbol!,
                            coinImageUrl: state.coinList[index].id!,
                          );
                        }),
                      ),
                    );
                  }

                  return Text('coin list here');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
