import 'package:air_plane/cubit/page_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccesCheckoutPage extends StatelessWidget {
  const SuccesCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/image_success.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Well Booked 😍",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            CustomButton(
              title: "My Bookings",
              width: 220,
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
