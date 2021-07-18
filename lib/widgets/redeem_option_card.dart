import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RedeemOptionCard extends StatelessWidget {
  RedeemOptionCard(this.title, this.tagLine, this.route);

  final title;
  final tagLine;
  final route;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width * 0.88,
      height: _height * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Color(0xffeeeeee),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Color(0xff393e46),
              fontSize: 34,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: _width * 0.88 * 0.6,
            child: Text(
              tagLine,
              style: GoogleFonts.poppins(
                color: Color(0xff393e46),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight, 
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, route);
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
                  color: Color(0xff00adb5),
                ),
                width: _width * 0.88 * 0.5,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Redeem",
                      style: GoogleFonts.poppins(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      FontAwesomeIcons.checkCircle,
                      size: 20,
                      color: Color(0xffeeeeee),
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
