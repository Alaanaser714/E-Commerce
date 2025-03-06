import 'package:e_commerce/core/entities/add_products_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCarItem(CartItemEntity carItem) {
    cartItems.remove(carItem);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += carItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExis(AddProductsEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.addProductsEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCarItem(AddProductsEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.addProductsEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(addProductsEntity: product, quanitty: 1);
  }
}
