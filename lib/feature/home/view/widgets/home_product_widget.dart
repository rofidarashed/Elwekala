import 'package:el_wekala/core/utils/animations/fade_in_animation.dart';
import 'package:el_wekala/feature/details/view/screen/details_screen.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_price_cart.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_product_image_fav.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_product_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const HomeProductWidget({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProductImage(productModel: productModel),
                SizedBox(height: 12.h),
                ProductNameStatus(productModel: productModel),
                SizedBox(height: 8.h),
                Text(
                  productModel.description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 12.h),
                CustomPriceAndCartIcon(productModel: productModel),
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(productModel: productModel),
          ),
        ),
      ),
    );
  }
}