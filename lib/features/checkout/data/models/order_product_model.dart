import '../../../home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(
      {required CartItemEntity cartItemEntity}) {
    return OrderProductModel(
      name: cartItemEntity.addProductsEntity.name,
      code: cartItemEntity.addProductsEntity.code,
      imageUrl: cartItemEntity.addProductsEntity.imageUrl!,
      price: cartItemEntity.addProductsEntity.price.toDouble(),
      quantity: cartItemEntity.quanitty,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
