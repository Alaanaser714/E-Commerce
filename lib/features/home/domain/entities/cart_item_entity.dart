import 'package:e_commerce/core/entities/add_products_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final AddProductsEntity addProductsEntity;
  int quanitty;

  CartItemEntity({required this.addProductsEntity, this.quanitty = 0});

  num calculateTotalPrice() {
    return addProductsEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return addProductsEntity.unitAmount * quanitty;
  }

  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    quanitty--;
  }

  @override
  List<Object?> get props => [addProductsEntity];
}
