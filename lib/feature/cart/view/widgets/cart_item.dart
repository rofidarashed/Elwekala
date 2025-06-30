import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final CartModel cartMiodel;
  const CartItem({super.key, required this.cartMiodel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            Image.network(cartMiodel.image, height: 100, width: 50),
            Text(cartMiodel.name),
            Spacer(),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () => context.read<CartCubit>().deleteCartCubit(
                productId: cartMiodel.id,
              ),
            ),

            InkWell(
              child: Icon(Icons.edit),
              onTap: () => context.read<CartCubit>().updateCartCubit(
                productId: cartMiodel.id,
                quantity: cartMiodel.quantity,
              ),
            ),
          ],
        );
      },
    );
  }
}
