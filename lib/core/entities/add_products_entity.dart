import 'package:e_commerce/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class AddProductsEntity extends Equatable {
  final String name;
  final String code;
  final String desc;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  AddProductsEntity({
    required this.name,
    required this.code,
    required this.desc,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  @override
  List<Object?> get props => [code, name];
}
