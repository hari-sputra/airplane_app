
import 'package:air_plane/ui/pages/home/detail_page.dart';
import 'package:flutter/material.dart';

import '../../models/destinations_model.dart';
import '../../shared/theme.dart';

class CustomListTileNewDestination extends StatelessWidget {
  final DestinationsModel destinations;

  const CustomListTileNewDestination(
    this.destinations, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              destinations,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 90,
        padding: EdgeInsets.only(right: 16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, right: 16, bottom: 16),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    destinations.img,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    destinations.name,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    destinations.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 4),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/icon_star.png",
                  ),
                ),
              ),
            ),
            Text(
              destinations.rating.toString(),
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
