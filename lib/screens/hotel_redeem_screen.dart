import 'package:flutter/material.dart';
import 'package:travelscape/widgets/redeem_card.dart';
import 'package:travelscape/widgets/custom_app_bar.dart';

class HotelRedeemScreen extends StatelessWidget {
  const HotelRedeemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff7f5af0),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.11),
          child: CustomAppBar(),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: _height * 0.05),
                RedeemCard(
                  "W Hotels",
                  "20% off on first stay.",
                  10,
                  "whotels",
                ),
                SizedBox(height: _height * 0.061),
                RedeemCard(
                  "JW Marriott",
                  "15% off on stay.",
                  50,
                  "jwmarriott",
                ),
                SizedBox(height: _height * 0.061),
                RedeemCard(
                  "The Taj",
                  "25% off on stay.",
                  100,
                  "taj",
                ),
                SizedBox(height: _height * 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
