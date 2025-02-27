import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exeptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/firebase_services.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
    try {
      var user = await firebaseServices.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(e.toString());

      return Left(
          ServerFailure(message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      var user = await firebaseServices.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(e.toString());

      return Left(
          ServerFailure(message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى."));
    }
  }
}
