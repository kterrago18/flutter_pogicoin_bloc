import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pogicoin_bloc/data/repository/coin_repository.dart';
import 'package:flutter_pogicoin_bloc/ui/screens/coin_detail_screen.dart';

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
      child: BlocListener<CoinListBloc, CoinListState>(
        listener: (context, state) {
          if (state is CoinListLoadingFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("ERROR: ${state.errorMessage}"),
            ));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('CoinPogi'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CoinListBloc, CoinListState>(
                  builder: (context, state) {
                    if (state is CoinListLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (state is CoinListLoaded) {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            context.read<CoinListBloc>().add(LoadCoins());
                          },
                          child: ListView.builder(
                            itemCount: 30,
                            itemBuilder: ((context, index) {
                              return CoinCard(
                                coinModel: state.coinList[index],
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CoinDetailScreen(
                                      coinModel: state.coinList[index],
                                    );
                                  }));
                                },
                              );
                            }),
                          ),
                        ),
                      );
                    }

                    return const Text('Coin list here');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
