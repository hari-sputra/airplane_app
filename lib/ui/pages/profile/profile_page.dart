import 'dart:io';

import 'package:airplane_app/main.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  
  
  const ProfilePage({
    Key? key,
   
    
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  @override
  Widget build(BuildContext context) {
    // Note: Circle avatar
    Widget circleAvatar() {
      return GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/image_profile.png",
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: kPrimaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              circleAvatar(),
            ],
          ),
        ),
      ),
    );
  }
}
