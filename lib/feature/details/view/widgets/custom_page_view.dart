import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  final ProductModel productModel;
  const CustomPageView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(productModel.images.length, (index) {
            return Image.network(productModel.images[index], height: 50);
          }),
        ],
      ),
    );
  }
}
