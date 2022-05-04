import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pogicoin_bloc/data/repository/coin_repository.dart';
import 'package:flutter_pogicoin_bloc/models/coin_model.dart';

part 'coin_list_event.dart';
part 'coin_list_state.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  CoinListBloc({required CoinRepository coinRepository})
      : _coinRepository = coinRepository,
        super(CoinListInitial()) {
    on<LoadCoins>(_loadCoins);
  }

  final CoinRepository _coinRepository;

  Future<void> _loadCoins(LoadCoins event, Emitter<CoinListState> emit) async {
    emit(CoinListLoading());

    try {
      final coinList = await _coinRepository.loadCoins();

      if (coinList.isEmpty) {
        emit(CoinListEmpty());
      } else {
        emit(CoinListLoaded(coinList: coinList));
      }
    } on SocketException {
      emit(CoinListLoadingError());
    } catch (e) {
      emit(
        CoinListLoadingFailed(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
