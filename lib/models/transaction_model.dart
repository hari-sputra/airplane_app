import 'package:airplane_app/models/destinations_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationsModel destinations;
  final int traveler, price, grandTotal;
  final String selectedSeat;
  final bool insurance, refundable;
  final double vat;

  TransactionModel({
    this.id = '',
    required this.destinations,
    this.traveler = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destinations: DestinationsModel.fromJson(
          json['destinations']['id'],
          json['destination'],
        ),
        traveler: json['traveler'],
        price: json['price'],
        grandTotal: json['grandTotal'],
        selectedSeat: json['selectedSeat'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
      );

  @override
  List<Object?> get props => [
        destinations,
        traveler,
        price,
        grandTotal,
        selectedSeat,
        insurance,
        refundable,
        vat,
      ];
}
