import 'dart:async';

import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushReplacementNamed(context, '/get-started');
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/icon_plane.png",
                  ),
                ),
              ),
            ),
            Text(
              "AIRPLAN",
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 32,
                letterSpacing: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
