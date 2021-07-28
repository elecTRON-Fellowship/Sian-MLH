import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  CameraPreviewScreen({required this.imgPath});

  final String imgPath;

  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xff16161a),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff16161a),
        onPressed: () async {
          var totalPoints;
          await FirebaseFirestore.instance
              .collection("users")
              .doc("${FirebaseAuth.instance.currentUser!.uid}")
              .get()
              .then((value) {
            setState(() {
              totalPoints = value["points"];
            });
          });
          FirebaseFirestore.instance
              .collection("users")
              .doc("${FirebaseAuth.instance.currentUser!.uid}")
              .update(
            {
              'points': totalPoints + 20,
            },
          );
          Share.shareFiles([widget.imgPath],
              text: "Shared via TravelScape, your favourite tourism app! #TravelScape").then((value){
                Navigator.pushNamed(context, "/map");
              });
        },
        child: Icon( 
          Icons.share,
          color: Color(0xfffffffe),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
