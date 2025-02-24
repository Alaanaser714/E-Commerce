// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.preffixWidget,
    this.maxLength,
    this.controller,
    this.keyboardType,
    required this.hintText,
  });
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? preffixWidget;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String hintText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      validator: widget.validator,
      obscureText: widget.isPassword ? isObscured : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.f13w700(context).copyWith(
          color: Color(0xff949D9E),
        ),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        prefixIcon: widget.preffixWidget,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
              )
            : widget.suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE6E9EA), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
