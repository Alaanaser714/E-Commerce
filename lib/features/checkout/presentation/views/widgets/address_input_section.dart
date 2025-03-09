import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                hintText: "الاسم كامل",
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity!.name =
                      value;
                },
              ),
              CustomTextFormField(
                hintText: "البريد الإلكتروني",
                onSaved: (value) {
                  context
                      .read<OrderInputEntity>()
                      .shippingAddressEntity!
                      .email = value;
                },
              ),
              CustomTextFormField(
                hintText: "رقم الهاتف",
                onSaved: (value) {
                  context
                      .read<OrderInputEntity>()
                      .shippingAddressEntity!
                      .phone = value;
                },
              ),
              CustomTextFormField(
                hintText: "العنوان",
                onSaved: (value) {
                  context
                      .read<OrderInputEntity>()
                      .shippingAddressEntity!
                      .address = value;
                },
              ),
              CustomTextFormField(
                hintText: "المدينه",
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddressEntity!.city =
                      value;
                },
              ),
              CustomTextFormField(
                hintText: "رقم الطابق , رقم الشقه ..",
                onSaved: (value) {
                  context
                      .read<OrderInputEntity>()
                      .shippingAddressEntity!
                      .floor = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
