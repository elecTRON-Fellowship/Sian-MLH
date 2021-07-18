import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

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
        backgroundColor: Color(0xff00adb3),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
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
              text: "Shared via Sian, your favourite tourism app! #Sian");
        },
        child: Icon(Icons.share),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     width: double.infinity,
            //     height: 60.0,
            //     color: Colors.black,
            //     child: Center(
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.share,
            //           color: Colors.white,
            //         ),
            //         onPressed: () async {
            //           var totalPoints;
            //           await FirebaseFirestore.instance
            //               .collection("users")
            //               .doc("${FirebaseAuth.instance.currentUser!.uid}")
            //               .get()
            //               .then((value) {
            //             setState(() {
            //               totalPoints = value["points"];
            //             });
            //           });
            //           FirebaseFirestore.instance
            //               .collection("users")
            //               .doc("${FirebaseAuth.instance.currentUser!.uid}")
            //               .update(
            //             {
            //               'points': totalPoints + 20,
            //             },
            //           );
            //           Share.shareFiles([widget.imgPath],
            //               text:
            //                   "Shared via Sian, your favourite tourism app! #Sian");
            //         },
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
