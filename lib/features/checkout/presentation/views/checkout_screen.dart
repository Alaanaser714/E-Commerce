import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_screen_body.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../core/repos/order_repo/orders_repo.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/functions/get_user.dart';
import '../../domain/entities/shipping_address_entity.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late OrderInputEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      uID: getUser().password,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "الشحن",
        ),
        body: Provider.value(
          value: orderEntity,
          child: BlocConsumer<AddOrderCubit, AddOrderState>(
            listener: (context, state) {
              if (state is AddOrderSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "تم انشاء الطلب بنجاح",
                    style: AppStyles.f16w400(context),
                  ),
                ));
              } else if (state is AddOrderFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(
                    state.errMessage,
                    style: AppStyles.f16w400(context),
                  ),
                ));
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is AddOrderLoading ? true : false,
                  child: CheckoutScreenBody());
            },
          ),
        ),
      ),
    );
  }
}
