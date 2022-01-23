
import 'package:air_plane/models/destinations_model.dart';
import 'package:air_plane/ui/pages/home/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomCardPopularDestination extends StatelessWidget {
  final DestinationsModel destinations;

  const CustomCardPopularDestination(
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
            builder: (context) => DetailPage(destinations),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        width: 200,
        height: 323,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
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
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        defaultRadius,
                      ),
                    ),
                    color: kWhiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(left: 2, right: 3),
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
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destinations.name,
                      overflow: TextOverflow.ellipsis,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
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
            )
          ],
        ),
      ),
    );
  }
}
