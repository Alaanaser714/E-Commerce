import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/repos/order_repo/orders_repo.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/endpoints.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

import '../../../features/checkout/data/models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseServices dataBaseService;

  OrdersRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity order}) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await dataBaseService.addData(
        path: Endpoints.addOrder,
        docId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: (e.toString())));
    }
  }
}
