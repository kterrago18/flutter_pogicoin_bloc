part of 'coin_details_bloc.dart';

abstract class CoinDetailsState extends Equatable {
  const CoinDetailsState();

  @override
  List<Object> get props => [];
}

class CoinDetailsInitial extends CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsLoaded extends CoinDetailsState {
  final CoinDetails coinDetails;

  const CoinDetailsLoaded(this.coinDetails);

  @override
  List<Object> get props => [coinDetails];
}

class CoinDetailsLoadingFailed extends CoinDetailsState {
  final String errorMessage;

  const CoinDetailsLoadingFailed(this.errorMessage);
}

class CoinDetailsLoadingError extends CoinDetailsState {}
