part of 'coin_details_bloc.dart';

abstract class CoinDetailsEvent extends Equatable {
  const CoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinDetails extends CoinDetailsEvent {
  final String coinId;

  const LoadCoinDetails(this.coinId);
}
