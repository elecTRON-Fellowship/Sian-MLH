import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:sian/screens/calendar.dart';
import 'package:sian/screens/create_account_screen.dart';
import 'package:sian/screens/home_screen.dart';
import 'package:sian/screens/redeemerrorscreen.dart';
import 'package:sian/screens/restaurant_redeem_screen.dart';
import 'package:sian/screens/cafe_redeem_screen.dart';
import 'package:sian/screens/hotel_redeem_screen.dart';
import 'package:sian/screens/login_screen.dart';
import 'package:sian/screens/redeemed_screen.dart';
import 'package:sian/screens/redeem_option_screen.dart';
import 'package:sian/screens/map_screen.dart';
import 'package:sian/screens/splash_screen.dart';
import 'package:sian/screens/camera_screen.dart';

late List<CameraDescription> cameras;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(Sian());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class Sian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        "/": (context) => CreateAccountScreen(),
        "/splash": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => CreateAccountScreen(),
        "/home": (context) => HomeScreen(),
        "/map": (context) => MapScreen(),
        "/camera": (context) => CameraScreen(cameras),
        "/redeem": (context) => RedeemOptionScreen(),
        "/cafe": (context) => CafeRedeemScreen(),
        "/restaurant": (context) => RestaurantRedeemScreen(),
        "/hotel": (context) => HotelRedeemScreen(),
        "/redeemed": (context) => RedeemedScreen(),
        "/redeemederror": (context) => RedeemedErrorScreen(),
        "/calendar": (context) => CalendarScreen(),
      },
    );
  }
}
