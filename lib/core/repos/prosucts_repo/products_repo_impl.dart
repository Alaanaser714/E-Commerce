import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/add_products_entity.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/models/add_products_model.dart';
import 'package:e_commerce/core/repos/prosucts_repo/products_repo.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/endpoints.dart';

class ProductsRepoImpl implements ProductsRepo {
  DatabaseServices databaseServices;
  ProductsRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<AddProductsEntity>>>
      getBestSellingProducts() async {
    try {
      var data =
          await databaseServices.getData(path: Endpoints.getProducts, query: {
        "limit": 10,
        "orderBy": "sellingCount",
        "decending": true,
      }) as List<Map<String, dynamic>>;

      List<AddProductsEntity> products =
          data.map((e) => AddProductsModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: "فشل في الحصول على المنتجات"));
    }
  }

  @override
  Future<Either<Failure, List<AddProductsEntity>>> getProducts() async {
    try {
      var data = await databaseServices.getData(path: Endpoints.getProducts)
          as List<Map<String, dynamic>>;

      List<AddProductsEntity> products =
          data.map((e) => AddProductsModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: "فشل في الحصول على المنتجات"));
    }
  }
}
