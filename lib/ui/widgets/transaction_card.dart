import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/ui/widgets/checkout_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        transaction.destinations.img,
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
                        transaction.destinations.name,
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        transaction.destinations.city,
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
                  transaction.destinations.rating.toString(),
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
            deskription: "${transaction.traveler} Person",
          ),
          CheckoutDetail(
            title: "Seat",
            deskription: transaction.selectedSeat,
          ),
          CheckoutDetail(
            title: "Insurance",
            deskription: transaction.insurance ? 'YES' : 'NO',
            text: transaction.insurance ? kGreenColor : kPinkColor,
          ),
          CheckoutDetail(
            title: "Refundable",
            deskription: transaction.refundable ? 'YES' : 'NO',
            text: transaction.refundable ? kGreenColor : kPinkColor,
          ),
          CheckoutDetail(
            title: "VAT",
            deskription: "${(transaction.vat * 100).toStringAsFixed(0)}%",
          ),
          CheckoutDetail(
            title: "Price",
            deskription: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.price),
          ),
          CheckoutDetail(
            title: "Grand Total",
            deskription: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.grandTotal),
            text: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
