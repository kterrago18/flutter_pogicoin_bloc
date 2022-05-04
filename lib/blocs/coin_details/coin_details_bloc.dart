import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pogicoin_bloc/data/repository/coin_repository.dart';
import 'package:flutter_pogicoin_bloc/models/coin_details_model.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  CoinDetailsBloc({required CoinRepository coinRepository})
      : _coinRepository = coinRepository,
        super(CoinDetailsInitial()) {
    on<LoadCoinDetails>(_loadCoinDetails);
  }

  final CoinRepository _coinRepository;

  Future<void> _loadCoinDetails(
      LoadCoinDetails event, Emitter<CoinDetailsState> emit) async {
    emit(CoinDetailsLoading());

    try {
      final response = await _coinRepository.loadCoinDetails(event.coinId);

      if (response != null) {
        emit(CoinDetailsLoaded(response));
      } else {
        emit(const CoinDetailsLoadingFailed('ERROR: coin details is null'));
      }
    } on SocketException {
      emit(CoinDetailsLoadingError());
    } catch (e) {
      emit(CoinDetailsLoadingFailed(e.toString()));
    }
  }
}
