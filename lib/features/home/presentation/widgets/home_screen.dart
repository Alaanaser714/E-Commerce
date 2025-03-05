import 'package:e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce/core/repos/prosucts_repo/products_repo.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductsRepo>(),
      ),
      child: HomeScreenBody(),
    );
  }
}
