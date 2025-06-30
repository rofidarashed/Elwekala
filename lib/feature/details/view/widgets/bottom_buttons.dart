import 'package:el_wekala/core/widgets/custom_fav_icon.dart';
import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDetailsBottomButtons extends StatelessWidget {
  const CustomDetailsBottomButtons({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomFavIcon(productModel: productModel),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              context.read<CartCubit>().addCartCubit(
                productId: productModel.id,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Product Added from cart successfully'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Add to cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
