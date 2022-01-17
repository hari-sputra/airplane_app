import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TextFormFieldProfile extends StatelessWidget {
  final String title, hintText;
  final EdgeInsets margin;
  final bool obscureText;
  final TextInputType textInputType;
  final bool readOnly;
  final String initalValue;

  const TextFormFieldProfile({
    Key? key,
    required this.title,
    required this.hintText,
    this.margin = EdgeInsets.zero,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.initalValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle,
          ),
          SizedBox(height: 6),
          TextFormField(
            readOnly: readOnly,
            obscureText: obscureText,
            keyboardType: textInputType,
            style: blackTextStyle,
            cursorColor: kBlackColor,
            initialValue: initalValue,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: greyTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
