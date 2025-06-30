import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      productModel.status,
      style: TextStyle(
        color: productModel.status == 'New'
            ? Colors.blueAccent
            : Colors.blueGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
