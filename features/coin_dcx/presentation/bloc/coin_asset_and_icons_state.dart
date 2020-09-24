part of 'coin_asset_and_icons_bloc.dart';

abstract class CoinAssetAndIconsState extends Equatable {
  final List props1;
  const CoinAssetAndIconsState({this.props1 = const <dynamic>[]});

  @override
  List<Object> get props => [props1];
}

class Empty extends CoinAssetAndIconsState {}

class Loading extends CoinAssetAndIconsState {}

class LoadedCoinAssets extends CoinAssetAndIconsState {
  final List<CoinAssets> coinAssetsList;

  LoadedCoinAssets({@required this.coinAssetsList})
      : super(props1: [coinAssetsList]);
}

class Error extends CoinAssetAndIconsState {
  final String message;

  Error({@required this.message}) : super(props1: [message]);
}
