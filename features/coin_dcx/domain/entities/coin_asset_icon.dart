import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

class CoinAssetIcon extends Equatable {
  final String assetId;
  final String assetIcon;

  CoinAssetIcon({@required this.assetId, @required this.assetIcon, String url});

  @override
  List<Object> get props => [assetId, assetIcon];
}
