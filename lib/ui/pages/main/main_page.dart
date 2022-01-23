
import 'package:air_plane/cubit/page_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/pages/home/home_page.dart';
import 'package:air_plane/ui/pages/settings/settings_page.dart';
import 'package:air_plane/ui/pages/transaction/transaction_page.dart';
import 'package:air_plane/ui/pages/wallet/wallet_page.dart';
import 'package:air_plane/ui/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: BuildContent
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    // Note: Custom Bottom NavBar
    Widget customNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            right: defaultMargin,
            left: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavItem(
                index: 0,
                img: "assets/icons/icon_home.png",
              ),
              CustomBottomNavItem(
                index: 1,
                img: "assets/icons/icon_booking.png",
              ),
              CustomBottomNavItem(
                index: 2,
                img: "assets/icons/icon_card.png",
              ),
              CustomBottomNavItem(
                index: 3,
                img: "assets/icons/icon_settings.png",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBgColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                customNavBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
