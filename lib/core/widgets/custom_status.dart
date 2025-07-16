import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Status extends StatelessWidget {
  const Status({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: productModel.status == 'New'
            ? Colors.blue[50]
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        productModel.status,
        style: TextStyle(
          fontSize: 10.sp,
          color: productModel.status == 'New'
              ? Colors.blue[800]
              : Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}