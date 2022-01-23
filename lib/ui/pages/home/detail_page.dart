
import 'package:air_plane/models/destinations_model.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/pages/home/seat_page.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/interest_items.dart';
import 'package:air_plane/ui/widgets/photo_items.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationsModel destinations;

  const DetailPage(this.destinations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: Background Image
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              destinations.img,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // Note: Shadow
    Widget customShadow() {
      return Container(
        height: 214,
        width: double.infinity,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    }

// Note: back button

// Note: Content
    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // Note: icon
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/icon_emblem.png",
                  ),
                ),
              ),
            ),

            // note: title dan city
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinations.name,
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destinations.city,
                          style: whiteTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 16,
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
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),

            // Note: description
            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    destinations.about,
                    style: blackTextStyle.copyWith(
                      height: 2,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: const [
                      PhotoItems(
                        img: "assets/images/image_photo1.png",
                      ),
                      PhotoItems(
                        img: "assets/images/image_photo2.png",
                      ),
                      PhotoItems(
                        img: "assets/images/image_photo3.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Interests",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      InterestItem(
                        title: "Kids Park",
                      ),
                      InterestItem(
                        title: "Honor Bridge",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      InterestItem(
                        title: "City Museum",
                      ),
                      InterestItem(
                        title: "Central Mall",
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Note: Price and button
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 31, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(destinations.price),
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "per orang",
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    title: "Book Now",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeatPage(destinations),
                        ),
                      );
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
