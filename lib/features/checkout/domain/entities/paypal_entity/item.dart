

import '../../../../../core/utils/functions/get_currency.dart';
import '../../../../home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  factory ItemEntity.fromEntity(CartItemEntity itemEntity) {
    return ItemEntity(
      name: itemEntity.addProductsEntity.name,
      quantity: itemEntity.quanitty,
      price: itemEntity.addProductsEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}