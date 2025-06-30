import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isChosen = context.read<CartCubit>().isChosen(productModel.id);

        return InkWell(
          child: Icon(
            isChosen ? Icons.shopping_cart : Icons.shopping_cart_outlined,
            color: isChosen ? Colors.green : Colors.grey,
          ),
          onTap: () {
            if (isChosen) {
              context.read<CartCubit>().deleteCartCubit(
                productId: productModel.id,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Product removed from cart successfully'),
                ),
              );
            } else {
              context.read<CartCubit>().addCartCubit(
                productId: productModel.id,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Product Added from cart successfully')),
              );
            }
          },
        );
      },
    );
  }
}
