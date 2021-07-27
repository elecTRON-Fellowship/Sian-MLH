import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelscape/screens/redeem_option_screen.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: 812,
              color: Color(0xff222831),
              padding: const EdgeInsets.only(
                top: 145,
                bottom: 199,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 333,
                    height: 468,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(0xffeeeeee),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 18,
                          top: 27,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 298,
                            height: 78,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  240.0, 2.0, 0.0, 0.0),
                              child: Icon(
                                FontAwesomeIcons.timesCircle,
                                size: 30,
                                color: Color(0xffeeeeee),
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
                              color: Color(0xff00adb5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 55,
                          top: 356,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 223,
                            height: 78,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 2.0, 0.0, 0.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/redeem');
                                },
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  size: 30,
                                  color: Color(0xffeeeeee),
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
                              color: Color(0xff00adb5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 65,
                          top: 40,
                          child: SizedBox(
                            width: 202,
                            height: 53,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                              child: Text(
                                "Error",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Color(0xffeeeeee),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 102,
                          top: 368,
                          child: SizedBox(
                            width: 130,
                            height: 53,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/redeem');
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  "Home",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffeeeeee),
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 319,
                              height: 156,
                              child: Text(
                                "You have insufficient points to redeem this offer.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Color(0xff393e46),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    ])));
  }
}
