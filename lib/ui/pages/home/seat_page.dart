import 'package:airplane_app/cubit/seat_cubit.dart';
import 'package:airplane_app/models/destinations_model.dart';
import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/pages/checkout/checkout_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/seat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SeatPage extends StatelessWidget {
  final DestinationsModel destinations;
  const SeatPage(this.destinations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: header
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Note: seat status
    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Note: available
            Container(
              margin: EdgeInsets.only(right: 6),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/icon_available.png",
                  ),
                ),
              ),
            ),
            Text(
              "Available",
              style: blackTextStyle,
            ),
            // Note: Selected
            Container(
              margin: EdgeInsets.only(right: 6, left: 10),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/icon_selected.png",
                  ),
                ),
              ),
            ),
            Text(
              "Selected",
              style: blackTextStyle,
            ),
            // Note: Unavailable
            Container(
              margin: EdgeInsets.only(right: 6, left: 10),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/icon_unavailable.png",
                  ),
                ),
              ),
            ),
            Text(
              "Unavailable",
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    // Note: select seat
    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                // Note: seat indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          "A",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          "B",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          "",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          "C",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          "D",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Note: seat select (1)
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A1',
                      ),
                      SeatItem(
                        id: 'B1',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "1",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                // Note: seat select (2)
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "2",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                // Note: seat select (3)
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "3",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                // Note: seat select (4)
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "4",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                // Note: seat select (5)
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "5",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),

                // Note: your seat
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your seat",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Note: price
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destinations.price),
                        style: purpleTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buttonCheckout() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 30, bottom: 46),
            child: CustomButton(
              title: "Continue to Checkout",
              onPressed: () {
                int price = destinations.price * state.length;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      TransactionModel(
                        destination: destinations,
                        traveler: state.length,
                        selectedSeat: state.join(', '),
                        insurance: true,
                        refundable: false,
                        price: price,
                        vat: 0.45,
                        grandTotal: price + (price * 0.45).toInt(),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                seatStatus(),
                selectSeat(),
                buttonCheckout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
