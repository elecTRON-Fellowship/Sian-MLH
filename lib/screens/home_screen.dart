import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sian/screens/map_screen.dart';
import 'package:sian/widgets/auth.dart';
import 'package:sian/widgets/google_auth.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff222831),
          body: ListView(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.calendarAlt,
                        size: 30,
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
                        size: 30,
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
                    "assets/SIAN.svg",
                    height: 350,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: width,
                        height: 416 / 812 * height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36),
                            topRight: Radius.circular(36),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color: Color(0xffeeeeee),
                        ),
                        padding: const EdgeInsets.only(
                          top: 41,
                          bottom: 55,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 311,
                              height: 55,
                              child: Text(
                                "Welcome to Sian",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff393e46),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 18.33),
                            SizedBox(
                              width: 311,
                              height: 118,
                              child: Text(
                                "A place where you get rewarded for exploring. Let the voyage begin.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Color(0xff393e46),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 18.33),
                            Container(
                              width: 239,
                              height: 58,
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
                                            color: Color(0xffeeeeee),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.arrowRight,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 38.33),
                          ],
                        ),
                      ),
                    ],
                  )
                ])
          ])),
    );
  }
}
