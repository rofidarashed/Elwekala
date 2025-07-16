import 'package:el_wekala/core/utils/animations/bounce_animation.dart';
import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isChosen = context.read<CartCubit>().isChosen(productModel.id);

        return BounceAnimation(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isChosen ? Colors.green[50] : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                isChosen ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                color: isChosen ? Colors.green : Colors.grey[600],
                size: 20.sp,
              ),
            ),
            onTap: () {
              if (isChosen) {
                context.read<CartCubit>().deleteCartItem(productModel.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Durations.medium4,
                    content: Text('Product removed from cart'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              } else {
                context.read<CartCubit>().addToCart(productModel.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product added to cart'),
                    duration: Durations.medium4,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
