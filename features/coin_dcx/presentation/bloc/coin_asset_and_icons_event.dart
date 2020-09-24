part of 'coin_asset_and_icons_bloc.dart';

abstract class CoinAssetAndIconsEvent extends Equatable {
  final List props1;
  const CoinAssetAndIconsEvent({this.props1 = const <dynamic>[]});

  @override
  List<Object> get props => props1;
}

class GetDataForCoinAsset extends CoinAssetAndIconsEvent {
  GetDataForCoinAsset();
}
