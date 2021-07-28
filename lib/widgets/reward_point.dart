import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardPointCounter extends StatelessWidget {
  final rewardPoint;  
  
  const RewardPointCounter(this.rewardPoint);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Points :  ${rewardPoint ?? "loading"}", 
        style: GoogleFonts.poppins(
          color: Color(0xfffffffe),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
