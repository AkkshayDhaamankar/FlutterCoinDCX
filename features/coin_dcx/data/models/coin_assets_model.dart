import 'package:coin_dcx/features/coin_dcx/domain/entities/coin_assets.dart';
import 'package:flutter/material.dart';

class CoinAssetsModel extends CoinAssets {
  CoinAssetsModel(
      {@required String assetId,
      @required String name,
      @required double priceUsd,
      @required String assetImage})
      : super(
            assetId: assetId,
            name: name,
            priceUsd: priceUsd,
            assetImage: assetImage);

  factory CoinAssetsModel.fromJson(Map<String, dynamic> json, String url) {
    return CoinAssetsModel(
        assetId: json["asset_id"] as String,
        name: json["name"] as String,
        priceUsd: checkDouble(json["price_usd"]),
        assetImage: url);
  }

  Map<String, dynamic> toJson() {
    return {"asset_id": assetId, "name": name, "price_usd": priceUsd};
  }

  static double checkDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else {
      return value ?? 0;
    }
  }
}
