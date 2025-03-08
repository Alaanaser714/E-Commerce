import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';

import 'shipping_address_entity.dart';

class OrderInputEntity {
  final String? uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddressEntity;
  OrderInputEntity({
    required this.cartEntity,
    this.payWithCash,
    this.shippingAddressEntity,
    this.uID,
  });

  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calcualteShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calcualteShippingDiscount();
  }

  @override
  String toString() {
    return 'OrderEntity{uID: $uID, cartEntity: $cartEntity, payWithCash: $payWithCash, shippingAddressEntity: $shippingAddressEntity}';
  }
}
