import 'package:flutter/material.dart';

import 'functions/app_function.dart';

abstract class AppStyles {
  static TextStyle f23w700(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 23),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle f13w600(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle f16w700(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle f19w700(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 19),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle f13w700(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle f16w400(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle f13w400(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle f11w600(context) {
    return TextStyle(
      fontSize: AppFunction.getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w600,
    );
  }
}
