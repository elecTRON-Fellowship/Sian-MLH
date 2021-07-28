import 'package:flutter/material.dart';
import 'package:travelscape/widgets/custom_app_bar.dart';
import 'package:travelscape/widgets/redeem_card.dart';

class CafeRedeemScreen extends StatelessWidget {
  const CafeRedeemScreen({ Key? key }) : super(key: key);

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
                  "Blue Tokai",
                  "Get free donut on first visit.",
                  10,
                  "bluetokai",
                ),
                SizedBox(height: _height * 0.061),
                RedeemCard(
                  "Koffi Bond",
                  "Free Cupcakes with every coffee.",
                  50,
                  "koffibond",
                ),
                SizedBox(height: _height * 0.061),
                RedeemCard(
                  "Starbucks",
                  "Buy 1 Latte get 1 Free.",
                  100,
                  "starbucks",
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