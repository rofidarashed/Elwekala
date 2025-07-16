import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${productModel.price.toString()}",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}