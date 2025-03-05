import 'package:e_commerce/features/home/presentation/widgets/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: HomeScreen(),
    );
  }
}
