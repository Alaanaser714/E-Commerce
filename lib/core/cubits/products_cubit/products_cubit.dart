import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/repos/prosucts_repo/products_repo.dart';
import 'package:meta/meta.dart';

import '../../entities/add_products_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) {
      emit(ProductsFailure(message: failure.message));
    }, (products) {
      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold((failure) {
      emit(ProductsFailure(message: failure.message));
    }, (products) {
      emit(ProductsSuccess(products: products));
    });
  }
}
