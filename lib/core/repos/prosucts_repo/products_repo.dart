import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/add_products_entity.dart';
import 'package:e_commerce/core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<AddProductsEntity>>> getProducts();
  Future<Either<Failure, List<AddProductsEntity>>> getBestSellingProducts();
}
