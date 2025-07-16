import 'package:el_wekala/core/utils/animations/scale_animation.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageView extends StatelessWidget {
  final ProductModel productModel;
  const CustomPageView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: PageView.builder(
          itemCount: productModel.images.length,
          itemBuilder: (context, index) {
            return ScaleAnimation(
              child: Image.network(
                productModel.images[index],
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }
}