import 'package:el_wekala/core/utils/animations/fade_in_animation.dart';
import 'package:el_wekala/core/widgets/custom_price.dart';
import 'package:el_wekala/core/widgets/custom_status.dart';
import 'package:el_wekala/feature/details/view/widgets/bottom_buttons.dart';
import 'package:el_wekala/feature/details/view/widgets/custom_page_view.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  const DetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FadeInAnimation(
        child: Container(
          margin: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPageView(productModel: productModel),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      productModel.name,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Price(productModel: productModel),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text('Status: ',
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  Status(productModel: productModel),
                ],
              ),
              SizedBox(height: 20.h),
              Text("Description:",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              Text(
                productModel.description,
                style: TextStyle(fontSize: 14.sp, color: Colors.blueGrey),
              ),
              Spacer(),
              CustomDetailsBottomButtons(productModel: productModel),
            ],
          ),
        ),
      ),
    );
  }
}