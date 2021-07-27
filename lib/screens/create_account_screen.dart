import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelscape/screens/home_screen.dart';
import 'package:travelscape/widgets/auth.dart';

// ignore: camel_case_types
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

// ignore: camel_case_types
class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final AuthService _auth = AuthService();
  String error = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff7f5af0),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/travelscape.svg",
                      height: _height * 250 / 744,
                    ),
                    Container(
                      width: _width,
                      height: _height * (744 - 250) / 744,
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
                        color: Color(0xff16161a),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 313 / 375 * _width,
                            height: 45 / 812 * _height,
                            child: Text(
                              "Create Account",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Color(0xfffffffe),
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.83 / 812 * _height),
                          Container(
                            width: 300 / 375 * _width,
                            height: 40 / 812 * _height,
                            child: TextField(
                              controller: nameController,
                              style: GoogleFonts.poppins(
                                color: Color(0xffd5d7d9),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                // errorText: error,
                                labelText: "Name",
                                labelStyle: GoogleFonts.poppins(
                                  color: Color(0xffd5d7d9),
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
                          SizedBox(height: 21 / 812 * _height),
                          Container(
                            width: 300 / 375 * _width,
                            height: 40 / 812 * _height,
                            child: TextField(
                              controller: emailController,
                              style: GoogleFonts.poppins(
                                color: Color(0xffd5d7d9),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                // errorText: error,
                                labelText: "Email",
                                labelStyle: GoogleFonts.poppins(
                                  color: Color(0xffd5d7d9),
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
                          SizedBox(height: 21 / 812 * _height),
                          Container(
                            width: 300 / 375 * _width,
                            height: 40 / 812 * _height,
                            child: TextField(
                              controller: passwordController,
                              style: GoogleFonts.poppins(
                                color: Color(0xffd5d7d9),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                // errorText: error,
                                labelText: "Password",
                                labelStyle: GoogleFonts.poppins(
                                  color: Color(0xffd5d7d9),
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
                          SizedBox(height: 21 / 812 * _height),
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
                                dynamic result = await _auth.register(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text);
                                if (result == "Enter a Stronger Password") {
                                  setState(() {
                                    error = "Enter a Stronger Password";
                                  });
                                } else if (result ==
                                    "Please Enter a Valid Email") {
                                  setState(() {
                                    error = "Please Enter a Valid Email";
                                  });
                                } else if (result ==
                                    "Email is already in Use") {
                                  setState(() {
                                    error = "Email is already in Use";
                                  });
                                } else if (result == "Unknown Error Occured") {
                                  setState(() {
                                    error = "Unknown Error Occured";
                                  });
                                } else {
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
                              width: 180 / 375 * _width,
                              height: 45 / 812 * _height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0x3f000000),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Center(
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xfffffffe),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 21 / 812 * _height),
                          Container(
                            width: 331 / 375 * _width,
                            height: 2 / 812 * _height,
                            color: Color(0x7f94a1b2),
                          ),
                          SizedBox(height: 21 / 812 * _height),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            child: Text(
                              "Already have an account? Log In",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xfffffffe),
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
