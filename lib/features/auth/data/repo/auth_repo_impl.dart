import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exeptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/firebase_services.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseServices firebaseServices;

  AuthRepoImpl({required this.firebaseServices});

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseServices.CreateUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on ClientExeption catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
