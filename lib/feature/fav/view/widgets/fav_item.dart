import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';

class FavItem extends StatelessWidget {
  final ProductModel productModel;
const FavItem({ super.key, required this.productModel });

  @override
  Widget build(BuildContext context){
    return Row(
              children: [
                Image.network(productModel.image, height: 100, width: 50),
                Text(productModel.name),
              ],
            );
  }
}