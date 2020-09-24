import 'package:coin_dcx/core/utils/colors.dart';
import 'package:coin_dcx/core/utils/gradient_text.dart';
import 'package:coin_dcx/features/coin_dcx/presentation/bloc/coin_asset_and_icons_bloc.dart';
import 'package:coin_dcx/features/coin_dcx/presentation/widgets/bottom_half.dart';
import 'package:coin_dcx/features/coin_dcx/presentation/widgets/top_half.dart';
import 'package:coin_dcx/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinDcxPage extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xfffa4b29), Color(0xfffa9f29)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 150.0, 4.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/coindxclogo.png',
          fit: BoxFit.cover,
        ),
        title: Row(children: <Widget>[
          RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 30.0),
                  children: <TextSpan>[
                TextSpan(text: 'Coin', style: TextStyle(color: Colors.black)),
              ])),
          GradientText(
            'DCX',
            gradient: LinearGradient(
                colors: [ColorClass.darkOrange, ColorClass.yellow]),
          )
        ]),
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey,
              ),
              onPressed: () {})
        ],
      ),
      body: BuildBody(
        context: context,
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  final BuildContext context;
  const BuildBody({Key key, @required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<CoinAssetAndIconsBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // Top half
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: TopHalf(),
              ),
              // Bottom half
              Expanded(
                child: BottomHalf(context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
