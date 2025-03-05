import 'package:e_commerce/core/entities/add_products_entity.dart';
import '../utils/functions/get_avg_rating.dart';
import 'review_model.dart';

class AddProductsModel {
  final String name;
  final String code;
  final String desc;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  AddProductsModel(
      {required this.name,
      required this.code,
      required this.desc,
      required this.price,
      required this.isFeatured,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      this.imageUrl,
      this.avgRating = 0,
      required this.isOrganic,
      required this.reviews,
      required this.sellingCount});

  factory AddProductsModel.fromJson(Map<String, dynamic> json) =>
      AddProductsModel(
        avgRating: getAvgRating(json['reviews'] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : []),
        name: json['name'],
        code: json['code'],
        desc: json['desc'],
        price: json['price'],
        isFeatured: json['isFeatured'],
        imageUrl: json['imageUrl'],
        expirationsMonths: json['expirationsMonths'],
        numberOfCalories: json['numberOfCalories'],
        unitAmount: json['unitAmount'],
        isOrganic: json['isOrganic'],
        reviews: json['reviews'] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : [],
        sellingCount: json['sellingCount'],
      );

  AddProductsEntity toEntity() {
    return AddProductsEntity(
      name: name,
      code: code,
      desc: desc,
      price: price,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'desc': desc,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'sellingCount': sellingCount,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
