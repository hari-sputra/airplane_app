import 'package:equatable/equatable.dart';

class DestinationsModel extends Equatable {
  final String id, name, city, img, about;
  final double rating;
  final int price;

  DestinationsModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.img = '',
    this.about = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationsModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationsModel(
        id: id,
        name: json['name'],
        city: json['city'],
        img: json['img'],
        about: json['about'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'img': img,
        'about': about,
        'rating': rating,
        'price': price,
      };

  @override
  List<Object?> get props => [id, name, city, img, about, rating, price];
}
