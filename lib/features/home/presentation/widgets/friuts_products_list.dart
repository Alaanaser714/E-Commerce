import 'package:flutter/material.dart';

import '../../../../core/widgets/fruits_item.dart';

class FriutsProductsList extends StatelessWidget {
  const FriutsProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FruitsItem(),
          );
        });
  }
}
