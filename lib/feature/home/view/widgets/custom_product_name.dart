import 'package:el_wekala/core/widgets/custom_status.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductNameStatus extends StatelessWidget {
  const ProductNameStatus({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            productModel.name,
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Status(productModel: productModel),
      ],
    );
  }
}

