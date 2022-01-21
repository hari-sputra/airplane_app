import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/theme.dart';

class WalletMainMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  const WalletMainMenu({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          color: kPrimaryColor,
          size: 32,
        ),
        Text(
          text,
          style: purpleTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
