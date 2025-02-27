import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exeptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/endpoints.dart';
import 'package:e_commerce/core/services/firebase_services.dart';
import 'package:e_commerce/core/services/firestore_services.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseServices firebaseServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(
      {required this.databaseServices, required this.firebaseServices});

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      var user = await firebaseServices.CreateUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, password: user.uid);

      await addData(user: userEntity);
      return Right(userEntity);
    } on ClientExeption catch (e) {
      if (user != null) {
        await firebaseServices.deleteUser();
      }
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      if (user != null) {
        await firebaseServices.deleteUser();
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseServices.LoginUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on ClientExeption catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      var user = await firebaseServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addData(user: userEntity);
      return Right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseServices.deleteUser();
      }

      log(e.toString());

      return Left(
          ServerFailure(message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      var user = await firebaseServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addData(user: userEntity);
      return Right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseServices.deleteUser();
      }
      log(e.toString());

      return Left(
          ServerFailure(message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future addData({required UserEntity user}) async {
    await databaseServices.addData(
        path: Endpoints.addUserData, data: user.toMap());
  }
}
