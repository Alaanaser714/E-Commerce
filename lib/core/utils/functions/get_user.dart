import 'dart:convert';

import 'package:e_commerce/features/auth/data/models/user_model.dart';

import '../../../features/auth/domain/entities/user_entity.dart';
import '../../constant/constant.dart';
import '../../services/shared_pref.dart';

UserEntity getUser() {
  var jsonString = SharedPref.getString(kuserDate);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
