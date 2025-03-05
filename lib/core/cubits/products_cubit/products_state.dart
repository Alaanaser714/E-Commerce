// ignore_for_file: must_be_immutable

part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<AddProductsEntity> products;

  ProductsSuccess({required this.products});
}

final class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure({required this.message});
}
