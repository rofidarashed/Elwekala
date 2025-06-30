import 'package:el_wekala/core/widgets/custom_price.dart';
import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPriceAndCartIcon extends StatelessWidget {
  const CustomPriceAndCartIcon({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Price(productModel: productModel),
            CustomCartIcon(productModel: productModel),
          ],
        );
      },
    );
  }
}

