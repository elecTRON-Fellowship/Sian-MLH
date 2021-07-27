import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelscape/screens/map_screen.dart';
import 'package:travelscape/widgets/auth.dart';
import 'package:travelscape/widgets/google_auth.dart';

// ignore: camel_case_types
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// ignore: camel_case_types
class _HomeScreenState extends State<HomeScreen> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff7f5af0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.calendarAlt,
                        size: _height * 30 / 744,
                        color: Color(0xffeeeeee),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/calendar");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.signOutAlt,
                        size: _height * 30 / 744,
                        color: Color(0xffeeeeee),
                      ),
                      onPressed: () {
                        _auth.signOut().then((value) {
                          final user = FirebaseAuth.instance.currentUser;
                          if (user == null) {
                            Navigator.pushNamed(context, '/');
                          }
                        });
                        signOutGoogle().then((value) {
                          final user = FirebaseAuth.instance.currentUser;
                          if (user == null) {
                            Navigator.pushNamed(context, '/');
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/travelscape.svg",
                  height: _height * 250/744,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: _width,
                        height: _height * 430 / 812,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36),
                            topRight: Radius.circular(36),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color: Color(0xff16161a),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Welcome to",
                                style: GoogleFonts.poppins(
                                  color: Color(0xfffffffe),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "TravelScape",
                                style: GoogleFonts.poppins(
                                  color: Color(0xffffffff),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0), 
                              child: SizedBox(
                                width: _width * 311 / 360,
                                child: Text(
                                  "A place where you get rewarded for exploring. Let the voyage begin.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xff999999),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0), 
                              child: Container(
                                width: _width * 239 / 360,
                                height: _height * 50 / 744,
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
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MapScreen(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 129,
                                    height: 34,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Let’s Explore",
                                            style: GoogleFonts.poppins(
                                              color: Color(0xff16161a),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Icon(
                                            FontAwesomeIcons.arrowRight,
                                            color: Color(0xff16161a),
                                          )
                                        ],
                                      ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
