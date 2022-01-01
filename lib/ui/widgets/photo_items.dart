import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class PhotoItems extends StatelessWidget {
  final String img;

  const PhotoItems({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
        image: DecorationImage(
          image: AssetImage(
            img,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
