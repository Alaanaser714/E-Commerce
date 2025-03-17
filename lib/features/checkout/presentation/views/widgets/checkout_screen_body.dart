import 'dart:developer';

import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../domain/entities/paypal_entity/paypal_payment_entity.dart';
import '../../cubit/add_order_cubit/add_order_cubit.dart';
import 'checkout_page_view.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CheckoutSteps(
            onTap: (index) {
              if (currentPageIndex == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (index == 1) {
                var orderEntity = context.read<OrderInputEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'يرجى اختيار طريقة الدفع',
                        style: AppStyles.f19w700(context)
                            .copyWith(color: Colors.redAccent),
                      ),
                    ),
                  );
                }
              } else {
                handleAddressValidation();
              }
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: ChekoutPageView(
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            text: getNextButtonText(currentPageIndex),
            onTap: () {
              if (currentPageIndex == 0) {
                handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                handleAddressValidation();
              } else {
                _processPayment(context);
              }
            },
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .1,
          )
        ],
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
      pageController.animateToPage(currentPageIndex + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'يرجى اختيار طريقة الدفع',
            style: AppStyles.f19w700(context).copyWith(color: Colors.redAccent),
          ),
        ),
      );
    }
  }

  void handleAddressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AVyYxxMGx7gEUIkvppiIpBTXo3SlnwYKgS75NPQi2HhWsDTiRjOjlPUJzglZX5mtTshYHv_q5_WK0mqw",
        secretKey:
            "EGo5evoD5PVjy9qavuFZeRx9zRXH73W77f4VacMj8TsDVEgqSpVdwBKl9S3gqcRTiQgVxYEbNSfuyvs2",
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          addOrderCubit.addOrder(order: orderEntity);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "تمت العمليه بنجاح",
                style: AppStyles.f19w700(context).copyWith(color: Colors.green),
              ),
            ),
          );
        },
        onError: (error) {
          Navigator.pop(context);
          log(error.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.toString(),
                style: AppStyles.f19w700(context)
                    .copyWith(color: Colors.redAccent),
              ),
            ),
          );
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
