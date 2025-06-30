import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/fav/cubit/fav_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:el_wekala/core/widgets/custom_fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image.network(
              productModel.image,
              height: 70,
              width: double.infinity,
            ),
            CustomFavIcon(productModel: productModel),
          ],
        );
      },
    );
  }
}
