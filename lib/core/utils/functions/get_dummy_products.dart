import 'package:e_commerce/core/entities/add_products_entity.dart';

AddProductsEntity getDummyProduct() {
  return AddProductsEntity(
    name: 'Apple',
    code: '123',
    desc: 'Fresh apple',
    price: 2.5,
    reviews: [],
    expirationsMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: null,
  );
}

List<AddProductsEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
