import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  @override
  void initState() {
    super.initState();
    _checkSession().then((status) {
      if (status) {
        _navigate();
      }
    });
  }

  Future<bool> _checkSession() async {
    await Future.delayed(Duration(seconds: 2), () {});
    return true;
  }

  void _navigate() async {
    final User? user = auth.currentUser;
    if (user == null) {
      Navigator.pushNamed(context, '/signup');
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff7f5af0),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/travelscape.svg',
            semanticsLabel: 'vector',
          ),
        ),
      ),
    );
  }
}
