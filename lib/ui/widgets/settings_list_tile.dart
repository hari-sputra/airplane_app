import 'package:airplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final String leading;
  final Function() onTap;
 
  const SettingsListTile({
    Key? key,
    required this.leading,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      child: ListTile(
        onTap: onTap,
        leading: Text(
          leading,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: kGreyColor,
        ),
        tileColor: kWhiteColor,
      ),
    );
  }
}
