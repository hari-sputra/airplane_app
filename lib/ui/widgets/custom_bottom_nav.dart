import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavItem extends StatelessWidget {
  final String img;
  final int index;

  CustomBottomNavItem({
    Key? key,
    required this.img,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.bounceIn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(
              img,
              width: 24,
              height: 24,
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kGreyColor,
            ),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? kPrimaryColor
                    : kTransparentColor,
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
