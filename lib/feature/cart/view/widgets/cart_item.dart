import 'package:ap2/feature/cart/cubit/cart_cubit.dart';
import 'package:ap2/feature/cart/cubit/cart_state.dart';
import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;
  const CartItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            Image.network(productModel.image, height: 100, width: 50),
            Text(productModel.name),
            Spacer(),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () => context.read<CartCubit>().deleteCartCubit(
                productId: productModel.id,
              ),
            ),
          ],
        );
      },
    );
  }
}
