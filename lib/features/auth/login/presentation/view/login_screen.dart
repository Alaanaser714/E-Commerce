import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "تسجيل دخول",
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
