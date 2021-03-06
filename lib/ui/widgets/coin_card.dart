import 'package:flutter/material.dart';
import 'package:flutter_pogicoin_bloc/models/coin_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required this.coinModel,
    this.onTap,
  }) : super(key: key);

  final Coin coinModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final is7DIncrease =
        double.parse(coinModel.percentChange7D!) > 0 ? true : false;
    final is1HIncrease =
        double.parse(coinModel.percentChange1H!) > 0 ? true : false;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.00),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildCircleIcon(coinModel.id ?? ''),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coinModel.name ?? ''),
                    Text(coinModel.symbol ?? ''),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('USD ${formatAmount(coinModel.priceUsd!)}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildArrowIcon(is1HIncrease),
                        Text(' ${coinModel.percentChange1H!} %'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildSparkLineImage(coinModel.id!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildArrowIcon(is7DIncrease),
                          Text(' ${coinModel.percentChange7D!} %'),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Icon _buildArrowIcon(bool isIncrease) {
    return isIncrease
        ? const Icon(
            Icons.arrow_upward,
            size: 12,
          )
        : const Icon(
            Icons.arrow_downward,
            size: 12,
          );
  }

  String formatAmount(String amount) {
    return double.parse(amount).toStringAsFixed(2);
  }

  Widget _buildSparkLineImage(String coinId) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      child: SvgPicture.network(
        'https://cryptocurrencyliveprices.com/sparkline/$coinId.svg',
        fit: BoxFit.fitWidth,
        semanticsLabel: coinId,
        placeholderBuilder: (context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildCircleIcon(String coinImageUrl) {
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
