// import 'package:flutter/material.dart';

// class CustomNetworkImage extends StatelessWidget {
//   const CustomNetworkImage({
//     super.key,
//     required this.imageUrl,
//   });

//   final String imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       imageUrl,
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كان رابط الصورة فارغًا أو غير صالح
    if (imageUrl.isEmpty) {
      return const Icon(Icons.broken_image, color: Colors.grey, size: 50);
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover, // ضبط الصورة لتناسب الحاوية
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null)
          return child; // إذا انتهى التحميل، اعرض الصورة
        return const Center(
          child: CircularProgressIndicator(), // مؤشر تحميل أثناء جلب الصورة
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image, color: Colors.grey, size: 50);
      },
    );
  }
}
