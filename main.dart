import 'package:coin_dcx/core/utils/colors.dart';
import 'package:coin_dcx/features/coin_dcx/presentation/pages/coin_dcx_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinDCX',
      home: CoinDcxPage(),
      theme:
          ThemeData(primaryColor: Colors.white, accentColor: ColorClass.yellow),
    );
  }
}
