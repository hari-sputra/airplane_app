import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/settings_list_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // Note: circle avatar
  Widget circleProfile() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(top: 24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/image_profile.png'),
                ),
                SizedBox(height: 8),
                Text(
                  state.user.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Jambi, Indonesia",
                  style: greyTextStyle,
                ),
              ],
            ),
          );
        }
        return Container(
          margin: EdgeInsets.only(top: 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/image_profile.png'),
              ),
              SizedBox(height: 8),
              Text("John Doe"),
              Text(""),
            ],
          ),
        );
      },
    );
  }

  // Note: List tile menu
  Widget listTileMenu(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              "My Account",
              style: purpleTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ),
          SizedBox(height: 8),
          SettingsListTile(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            leading: "My Profile",
          ),
          SettingsListTile(
            onTap: () {},
            leading: "My Address",
          ),
          SettingsListTile(
            onTap: () {},
            leading: "Card / Bank Account",
          ),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              "Support",
              style: purpleTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ),
          SizedBox(height: 8),
          SettingsListTile(
            onTap: () {},
            leading: "Help Center",
          ),
          SettingsListTile(
            onTap: () {},
            leading: "About",
          ),
          SettingsListTile(
            onTap: () {},
            leading: "Request Account Deletion",
          ),
        ],
      ),
    );
  }

  // Note: Sign Out Button
  Widget signOutButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kPinkColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/sign-in", (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: Container(
            margin: EdgeInsets.only(top: defaultMargin, bottom: 120),
            child: CustomButton(
              title: "Sign Out",
              width: 220,
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            circleProfile(),
            listTileMenu(context),
            signOutButton(),
          ],
        ),
      ),
    );
  }
}
