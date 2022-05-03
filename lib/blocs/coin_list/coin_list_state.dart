part of 'coin_list_bloc.dart';

abstract class CoinListState extends Equatable {
  const CoinListState();

  @override
  List<Object> get props => [];
}

class CoinListInitial extends CoinListState {}

class CoinListLoading extends CoinListState {}

class CoinListLoaded extends CoinListState {
  final List<Coin> coinList;

  const CoinListLoaded({required this.coinList});

  @override
  List<Object> get props => [coinList];
}

class CoinListEmpty extends CoinListState {}

class CoinListLoadingError extends CoinListState {}

class CoinListLoadingFailed extends CoinListState {
  final String errorMessage;

  const CoinListLoadingFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
