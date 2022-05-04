import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pogicoin_bloc/data/repository/coin_repository.dart';

import '../../blocs/coin_details/coin_details_bloc.dart';
import '../../models/coin_model.dart';

class CoinDetailScreen extends StatelessWidget {
  const CoinDetailScreen({Key? key, required this.coinModel}) : super(key: key);

  final Coin coinModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoinDetailsBloc(coinRepository: context.read<CoinRepository>())
            ..add(LoadCoinDetails(coinModel.id!)),
      child: BlocListener<CoinDetailsBloc, CoinDetailsState>(
        listener: (context, state) {
          if (state is CoinDetailsLoadingFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("ERROR: ${state.errorMessage}"),
            ));
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  _buildCircleIcon(coinModel.id!),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(coinModel.name!),
                        Text(coinModel.symbol!),
                        Text('USD ${formatAmount(coinModel.priceUsd!)}')
                      ],
                    ),
                  )
                ]),
              ),
              BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
                builder: (context, state) {
                  if (state is CoinDetailsLoaded) {
                    return Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Text('High'),
                            trailing: Text(
                                '${state.coinDetails.high?.toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            leading: const Text('Low'),
                            trailing: Text(
                                '${state.coinDetails.low?.toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            leading: const Text('Open'),
                            trailing: Text(
                                '${state.coinDetails.open?.toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            leading: const Text('Close'),
                            trailing: Text(
                                '${state.coinDetails.close?.toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            leading: const Text('Volume'),
                            trailing: Text(
                                '${state.coinDetails.volume?.toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            leading: const Text('Market Cap'),
                            trailing: Text(
                                '${state.coinDetails.marketCap?.toStringAsFixed(2)}'),
                          ),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: const CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCircleIcon(String coinId) {
    return Container(
      width: 80.0,
      height: 80.0,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          'https://cryptocurrencyliveprices.com/img/$coinId.png',
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

  String formatAmount(String amount) {
    return double.parse(amount).toStringAsFixed(2);
  }
}
