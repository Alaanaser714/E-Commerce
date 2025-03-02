import 'dart:convert';

import 'package:e_commerce/core/constant/constant.dart';
import 'package:e_commerce/core/services/shared_pref.dart';
import 'package:flutter/material.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';

class AppFunction {
  static double getResponsiveFontSize(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      //600
      return width / 400; //400
    } else if (width < 900) {
      //900
      return width / 700; //700
    } else {
      return width / 1000; //1000
    }
  }

  UserEntity getUser() {
    var jsonString = SharedPref.getString(kuserDate);
    var userEntity = UserModel.fromJson(jsonDecode(jsonString));
    return userEntity;
  }
}
