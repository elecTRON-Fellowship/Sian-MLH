import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class RedeemedErrorScreen extends StatefulWidget {
  const RedeemedErrorScreen({Key? key}) : super(key: key);

  @override
  _RedeemedErrorScreenState createState() => _RedeemedErrorScreenState();
}

// ignore: camel_case_types
class _RedeemedErrorScreenState extends State<RedeemedErrorScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff7f5af0),
        body: Center(
          child: Container(
            width: _width * 0.9,
            height: _height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Color(0xff16161a),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfffffffe),
                    ),
                    width: _width * 240 / 360,
                    height: _height * 60 / 744,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Error",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color(0xff16161a),
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.timesCircle,
                          color: Color(0xff16161a),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: _width * 240 / 360,
                    child: Text(
                      "You don't have sufficient points to redeem this offer.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xff999999),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: _width * 240 / 360,
                    height: _height * 70 / 744,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/redeem');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.arrowLeft,
                              size: 28,
                              color: Color(0xff16161a),
                            ),
                            Text(
                              "More Offers",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Color(0xff16161a),
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
