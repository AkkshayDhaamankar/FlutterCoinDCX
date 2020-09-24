import 'dart:convert';
import 'package:coin_dcx/core/error/exceptions.dart';
import 'package:coin_dcx/features/coin_dcx/data/models/coin_asset_icon_model.dart';
import 'package:http/http.dart' as http;
import 'package:coin_dcx/features/coin_dcx/data/models/coin_assets_model.dart';
import 'package:flutter/material.dart';

abstract class CoinDcxRemoteDataSource {
  Future<List<CoinAssetsModel>> getCoinDataForAssets();
}

class CoinDcxRemoteDataSourceImpl implements CoinDcxRemoteDataSource {
  final http.Client client;
  CoinDcxRemoteDataSourceImpl({@required this.client});
  List<CoinAssetsModel> listCoinAssets = List<CoinAssetsModel>();
  List<CoinAssetIconModel> listCoinAssetIcons = List<CoinAssetIconModel>();

  final queryParamters = {
    'filter_asset_id': "BTC,USD,PLN,EUR,AUD,GBP,DKK,RUB,SGD,CAD,SLL"
  };

  @override
  Future<List<CoinAssetsModel>> getCoinDataForAssets() async {
    final uri = Uri.https('rest.coinapi.io', '/v1/assets', queryParamters);
    final responseAssetIcon = await client.get(
        'https://rest.coinapi.io/v1/assets/icons/128',
        headers: {'Accept': 'application/json', 'X-CoinAPI-Key': 'API_KEY'});
    final responseAssetData = await client.get(
      uri,
      headers: {'Accept': 'application/json', 'X-CoinAPI-Key': 'API_KEY'},
    );
    if (responseAssetIcon.statusCode == 200 &&
        responseAssetData.statusCode == 200) {
      var jsonArrayOfAssetIcons = jsonDecode(responseAssetIcon.body) as List;

      var jsonArrayOfAssetData = jsonDecode(responseAssetData.body) as List;
      for (int i = 0; i < jsonArrayOfAssetIcons.length; i++) {
        listCoinAssetIcons.add(
            CoinAssetIconModel.fromJson(jsonArrayOfAssetIcons.elementAt(i)));
      }
      for (int i = 0; i < jsonArrayOfAssetData.length; i++) {
        CoinAssetIconModel coinAssetIconModel = listCoinAssetIcons.firstWhere(
            (element) =>
                element.assetId == jsonArrayOfAssetData[i]['asset_id']);

        listCoinAssets.add(CoinAssetsModel.fromJson(
            jsonArrayOfAssetData.elementAt(i), coinAssetIconModel.assetIcon));
      }

      return listCoinAssets;
    } else {
      throw ServerException();
    }
  }
}
