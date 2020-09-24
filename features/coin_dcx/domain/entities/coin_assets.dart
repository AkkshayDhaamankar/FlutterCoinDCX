import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CoinAssets extends Equatable {
  final String assetId;
  final String name;
  final double priceUsd;
  final String assetImage;

  CoinAssets(
      {@required this.assetId,
      @required this.name,
      @required this.priceUsd,
      @required this.assetImage});

  @override
  List<Object> get props => [assetId, name, priceUsd];
}
