import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RedeemCard extends StatefulWidget {
  RedeemCard(this.title, this.tagLine, this.points, this.image);

  final title;
  final tagLine;
  final points;
  final image;

  @override
  _RedeemCardState createState() => _RedeemCardState();
}

class _RedeemCardState extends State<RedeemCard> {

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width * 0.88,
      height: _height * 0.30, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Color(0xff16161a), 
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xfffffffe), 
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset('assets/${widget.image}.svg')
            ],
          ),
          SizedBox(
            width: _width * 0.88 * 0.6,
            child: Text(
              widget.tagLine,
              style: GoogleFonts.poppins(
                color: Color(0xfffffffe),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () async {
                var totalPoints = 0;
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc("${FirebaseAuth.instance.currentUser!.uid}")
                    .get()
                    .then((value) {
                  setState(() {
                    totalPoints = value["points"];
                  });
                });
                if (widget.points <= totalPoints) {
                  totalPoints = (totalPoints - widget.points).toInt();
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc("${FirebaseAuth.instance.currentUser!.uid}")
                      .update({
                    "points": totalPoints,
                  });
                  Navigator.pushNamed(context, "/redeemed");
                } else {
                  Navigator.pushNamed(context, "/redeemederror");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Color(0xfffffffe), 
                ),
                width: _width * 0.88 * 0.60,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.points.toString()} points",
                      style: GoogleFonts.poppins(
                        color: Color(0xff16161a),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      FontAwesomeIcons.checkCircle,
                      size: 20,
                      color: Color(0xff16161a), 
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
