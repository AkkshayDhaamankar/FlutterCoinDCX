import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_dcx/core/error/failures.dart';
import 'package:coin_dcx/features/coin_dcx/domain/entities/coin_assets.dart';
import 'package:coin_dcx/features/coin_dcx/domain/usecases/get_coin_assets_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'coin_asset_and_icons_event.dart';
part 'coin_asset_and_icons_state.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";

class CoinAssetAndIconsBloc
    extends Bloc<CoinAssetAndIconsEvent, CoinAssetAndIconsState> {
  final GetCoinAssetsData getCoinAssetsData;

  CoinAssetAndIconsBloc({@required this.getCoinAssetsData})
      : assert(getCoinAssetsData != null),
        super(Empty());

  @override
  Stream<CoinAssetAndIconsState> mapEventToState(
    CoinAssetAndIconsEvent event,
  ) async* {
    if (event is GetDataForCoinAsset) {
      yield Loading();
      final failureOrCoinAssets = await getCoinAssetsData.call();
      yield failureOrCoinAssets.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (coinAssetsDataList) =>
              LoadedCoinAssets(coinAssetsList: coinAssetsDataList));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
