import 'package:coin_dcx/features/coin_dcx/domain/entities/coin_asset_icon.dart';
import 'package:flutter/material.dart';

class CoinAssetIconModel extends CoinAssetIcon {
  CoinAssetIconModel({
    @required String assetId,
    @required String assetIcon,
  }) : super(assetId: assetId, assetIcon: assetIcon);

  factory CoinAssetIconModel.fromJson(Map<String, dynamic> json) {
    return CoinAssetIconModel(
        assetId: json["asset_id"] as String, assetIcon: json["url"] as String);
  }
  Map<String, dynamic> toJson() {
    return {"asset_id": assetId, "url": assetIcon};
  }
}
