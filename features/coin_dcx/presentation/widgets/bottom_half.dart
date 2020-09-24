import 'package:coin_dcx/core/utils/colors.dart';
import 'package:coin_dcx/features/coin_dcx/domain/entities/coin_assets.dart';
import 'package:coin_dcx/features/coin_dcx/presentation/bloc/coin_asset_and_icons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomHalf extends StatelessWidget {
  final BuildContext context;
  BottomHalf({@required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
          child: Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Currency',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 30.0,
              ),
              Text(
                'Price-USD',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        ListWidget()
      ],
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinAssetAndIconsBloc, CoinAssetAndIconsState>(
      builder: (context, state) {
        if (state is Empty) {
          return EmptyAndErrorWidget(
            message: 'Fetching Data...',
            context: context,
          );
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is LoadedCoinAssets) {
          return CoinDataDisplay(
            coinAssetsList: state.coinAssetsList,
          );
        } else if (state is Error) {
          return EmptyAndErrorWidget(
            message: state.message,
          );
        }
      },
    );
  }
}

class EmptyAndErrorWidget extends StatelessWidget {
  final String message;
  final BuildContext context;
  const EmptyAndErrorWidget({Key key, this.message, this.context})
      : super(key: key);

  void dispatchCoinAssetsList() {
    BlocProvider.of<CoinAssetAndIconsBloc>(context).add(GetDataForCoinAsset());
  }

  @override
  Widget build(BuildContext context) {
    dispatchCoinAssetsList();
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Text(message),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorClass.darkOrange,
        ),
      ),
    ));
  }
}

class CoinDataDisplay extends StatelessWidget {
  final List<CoinAssets> coinAssetsList;
  const CoinDataDisplay({Key key, this.coinAssetsList})
      : assert(coinAssetsList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: coinAssetsList.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ListTile(
                    isThreeLine: true,
                    title: Text(coinAssetsList.elementAt(index).name),
                    subtitle: Text("(" +
                        coinAssetsList.elementAt(index).assetId +
                        ")" +
                        "\n" +
                        "price(usd) : " +
                        coinAssetsList
                            .elementAt(index)
                            .priceUsd
                            .toStringAsFixed(2)),
                    leading: Image.network(
                      coinAssetsList.elementAt(index).assetImage,
                      width: 25,
                      height: 25,
                    ),
                    trailing: TrailingListTileRow(
                        coinAssetsList: coinAssetsList, index: index),
                  );
                })));
  }
}

class TrailingListTileRow extends StatelessWidget {
  final int index;
  const TrailingListTileRow(
      {Key key, @required this.coinAssetsList, @required this.index})
      : super(key: key);

  final List<CoinAssets> coinAssetsList;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorClass.darkOrange,
                ColorClass.yellow,
              ],
            ),
            borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.all(11.0),
        child: Text(
          'LEND ' + coinAssetsList.elementAt(index).assetId,
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 8, color: Colors.white),
        ),
      ),
    );
  }
}
