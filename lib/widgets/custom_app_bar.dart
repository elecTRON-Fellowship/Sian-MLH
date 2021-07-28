import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reward_point.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  var rewardPoint;

  getUserPoints() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get()
        .then((value) {
      setState(() {
        rewardPoint = value["points"];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.11,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300),
        color: Color(0xff16161a), 
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Icon(
                    FontAwesomeIcons.map,
                    size: MediaQuery.of(context).size.height * 0.045,
                    color: Color(0xfffffffe),
                  )),
              onTap: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
            RewardPointCounter(this.rewardPoint),
            GestureDetector(
              child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Icon(
                    Icons.wallet_membership_outlined,
                    size: MediaQuery.of(context).size.height * 0.045,
                    color: Color(0xfffffffe),
                  )),
              onTap: () {
                Navigator.pushNamed(context, '/redeem');
              },
            )
          ]),
    );
  }
}
