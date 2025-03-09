import 'package:e_commerce/features/checkout/presentation/views/widgets/paymet_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shapping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'address_input_section.dart';
import 'checkout_steps.dart';

class ChekoutPageView extends StatelessWidget {
  const ChekoutPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });
  final PageController pageController;
  final ValueListenable<AutovalidateMode> valueListenable;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: getSteps().length,
          itemBuilder: (context, index) {
            return getPages()[index];
          }),
    );
  }

  List<Widget> getPages() {
    return [
      ShappingSection(),
      AddressInputSection(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
      PaymetSection(
        pageController: pageController,
      ),
    ];
  }
}
