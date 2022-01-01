import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String title;

  const InterestItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            height: 16,
            width: 16,
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
        ],
      ),
    );
  }
}
