import 'package:coin_dcx/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TopHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: "DCXLend",
                    style: TextStyle(
                      color: ColorClass.darkOrange,
                    )),
                TextSpan(
                    text:
                        " is a secure and easy way to earn interests on cryptocurremcies",
                    style: TextStyle(
                      color: Colors.black,
                    ))
              ],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Minimum Lending Duration: 7 Days || Upto 2% Interest Rate || Cancel Anuytime',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontSize: 12.0),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Read FAQ\'s',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorClass.yellow,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.maxFinite,
          height: 30.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: Colors.grey[200]),
          child: Text(
            '    View Stats',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 10.0),
          ),
        ),
      ],
    );
  }
}
