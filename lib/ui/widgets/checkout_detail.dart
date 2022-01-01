import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CheckoutDetail extends StatelessWidget {
  final String title, deskription;
  final Color text;

  const CheckoutDetail({
    Key? key,
    required this.title,
    required this.deskription,
    this.text = kBlackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/icons/icon_check.png",
                ),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          Spacer(),
          Text(
            deskription,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: text,
            ),
          ),
        ],
      ),
    );
  }
}
