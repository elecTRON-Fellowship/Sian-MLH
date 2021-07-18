import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sian/screens/home_screen.dart';
import 'package:sian/widgets/auth.dart';
import 'package:sian/widgets/google_auth.dart';

// ignore: camel_case_types
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// ignore: camel_case_types
class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  String error = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff222831),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/SIAN.svg",
                      height: 350,
                    ),
                    Container(
                      width: width,
                      // height: 489 / 812 * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Color(0xffeeeeee),
                      ),
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 38,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 313 / 375 * width,
                            // height: 45 / 812 * height,
                            child: Text(
                              "Log In",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Color(0xff393e46),
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.83 / 812 * height),
                          Container(
                            width: 300,
                            height: 40,
                            child: TextField(
                              controller: emailController,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                // errorText: error,
                                labelText: "Email",
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Color(0x3f000000),
                                filled: true,
                              ),
                            ),
                          ),

                          SizedBox(height: 21 / 812 * height),
                          // Container(
                          //   width: 300,
                          //   height: 40,
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Container(
                          //         width: 300,
                          //         height: 40,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(20),
                          //           color: Color(0x3f000000),
                          //         ),
                          //         padding: const EdgeInsets.only(
                          //           left: 17,
                          //           right: 209,
                          //           top: 11,
                          //           bottom: 6,
                          //         ),
                          //         child: Row(
                          //           mainAxisSize: MainAxisSize.min,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.center,
                          //           children: [
                          //             Text(
                          //               "Password",
                          //               style: GoogleFonts.poppins(
                          //                 color: Color(0xff393e46),
                          //                 fontSize: 15,
                          //                 fontWeight: FontWeight.w500,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Container(
                            width: 300,
                            height: 40,
                            child: TextField(
                              controller: passwordController,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                // errorText: error,
                                labelText: "Password",
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Color(0x3f000000),
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 21 / 812 * height),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              error,
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                dynamic result = await _auth.signIn(
                                    emailController.text,
                                    passwordController.text);

                                if (result == "Enter A Valid Email-Id") {
                                  setState(() {
                                    error = "Enter a Stronger Password";
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                      error,
                                      style: GoogleFonts.poppins(),
                                    )));
                                  });
                                } else if (result == "Incorrect Password")
                                  setState(() {
                                    error = "Incorrect Password";
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                      error,
                                      style: GoogleFonts.poppins(),
                                    )));
                                  });
                                else if (result == "User Not Found")
                                  setState(() {
                                    error = "User Not Found";
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                      error,
                                      style: GoogleFonts.poppins(),
                                    )));
                                  });
                                else if (result == "User diasbled")
                                  setState(() {
                                    error = "User diasbled";
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                      error,
                                      style: GoogleFonts.poppins(),
                                    )));
                                  });
                                else if (result == "Too many requests")
                                  setState(() {
                                    error = "Too many requests";
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                      error,
                                      style: GoogleFonts.poppins(),
                                    )));
                                  });
                                else if (result == "Unknown error")
                                  setState(() {
                                    error = "Unknown error";
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                      error,
                                      style: GoogleFonts.poppins(),
                                    )));
                                  });
                                else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                      (route) => false);
                                }
                              } catch (e) {
                                print(e.toString());
                                setState(() {
                                  error = e.toString();
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0x3f000000),
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 13,
                                      top: 7,
                                      bottom: 10,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Log In",
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff393e46),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 21 / 812 * height),
                          Container(
                            // width: screen_width * 0.160,
                            // height: screen_height * 0.063,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xff222831),
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.google,
                                      size: 30,
                                      color: Color(0xffeeeeee),
                                    ),
                                  ),
                                  onTap: () {
                                    signInWithGoogle().then(
                                      (value) {
                                        final user =
                                            FirebaseAuth.instance.currentUser;
                                        if (user != null) {
                                          Navigator.pushNamed(context, '/home');
                                        }
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 21 / 812 * height),
                          Container(
                            width: 331,
                            height: 2,
                            color: Color(0x7fc4c4c4),
                          ),
                          SizedBox(height: 21 / 812 * height),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/");
                            },
                            child: Text(
                              "Don't have an account? Create Account",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
