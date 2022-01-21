import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/transaction_cubit.dart';
import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/services/notification_service.dart';
import 'package:airplane_app/ui/widgets/checkout_detail.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../shared/theme.dart';

class CheckoutPage extends StatefulWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationServices.init();
  }

  @override
  Widget build(BuildContext context) {
    // Note: Checkout header
    Widget checkoutHeader() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 291,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/image_checkout.png",
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DJB",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Jambi",
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      widget.transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Note: Checkout Detail
    Widget checkoutDetail() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
            // Note: detail tile
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                color: kWhiteColor,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.transaction.destination.img,
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
                          widget.transaction.destination.name,
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.transaction.destination.city,
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
                    widget.transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            // Note: Booking Details
            SizedBox(height: 20),
            Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            CheckoutDetail(
              title: "Traveler",
              deskription: "${widget.transaction.traveler} Person",
            ),
            CheckoutDetail(
              title: "Seat",
              deskription: widget.transaction.selectedSeat,
            ),
            CheckoutDetail(
              title: "Insurance",
              deskription: widget.transaction.insurance ? 'YES' : 'NO',
              text: widget.transaction.insurance ? kGreenColor : kPinkColor,
            ),
            CheckoutDetail(
              title: "Refundable",
              deskription: widget.transaction.refundable ? 'YES' : 'NO',
              text: widget.transaction.refundable ? kGreenColor : kPinkColor,
            ),
            CheckoutDetail(
              title: "VAT",
              deskription:
                  "${(widget.transaction.vat * 100).toStringAsFixed(0)}%",
            ),
            CheckoutDetail(
              title: "Price",
              deskription: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(widget.transaction.price),
            ),
            CheckoutDetail(
              title: "Grand Total",
              deskription: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(widget.transaction.grandTotal),
              text: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    // Note: Payment Details
    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 30),
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
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            defaultRadius,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/image_card.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/icons/icon_plane.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "Pay",
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              state.user.balance,
                            ),
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Current Balance",
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    // Note: Pay Now Button
    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success-checkout', (route) => false);
            NotificationServices.showNotification();
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kPinkColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 30),
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: EdgeInsets.only(bottom: 30),
            child: CustomButton(
              title: "Pay Now",
              onPressed: () {
                context
                    .read<TransactionCubit>()
                    .createTransaction(widget.transaction);
              },
            ),
          );
        },
      );
    }

    // Note: TAC
    Widget tac() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(
            bottom: 30,
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Terms and Conditions",
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
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
              children: [
                checkoutHeader(),
                checkoutDetail(),
                paymentDetail(),
                payNowButton(),
                tac(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
