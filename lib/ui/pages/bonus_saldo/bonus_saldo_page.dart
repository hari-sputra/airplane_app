import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BonusSaldoPage extends StatelessWidget {
  const BonusSaldoPage({Key? key}) : super(key: key);

  Widget saldo() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: 300,
            height: 211,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/image_card.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: whiteTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            state.user.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/icons/icon_plane.png",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Pay",
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 41),
                Text(
                  "Balance",
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                Expanded(
                  child: Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(state.user.balance),
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 26,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text("");
        }
      },
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: Text(
        "Big Bonus 🎉",
        style: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 32,
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        "We give you early credit so that\nyou can buy a flight ticket",
        style: greyTextStyle.copyWith(
          fontWeight: light,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget startButton(BuildContext context) {
    return CustomButton(
      title: "Start Fly Now",
      width: 220,
      margin: EdgeInsets.only(top: 50),
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/main");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            saldo(),
            title(),
            description(),
            startButton(context),
          ],
        ),
      ),
    );
  }
}
