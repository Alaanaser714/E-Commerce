import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/add_products_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';

import '../../../domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(AddProductsEntity productEntity) {
    bool isProductExist = cartEntity.isExis(productEntity);
    var cartItem = cartEntity.getCarItem(productEntity);
    if (isProductExist) {
      cartItem.increasQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity cartItem) {
    cartEntity.removeCarItem(cartItem);
    emit(CartItemRemoved());
  }
}
