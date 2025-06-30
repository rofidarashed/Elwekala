import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/fav/cubit/fav_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavIcon extends StatelessWidget {
  const CustomFavIcon({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final isFavorited = context.read<FavCubit>().isFav(productModel.id);

        return InkWell(
          child: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            color: isFavorited ? Colors.red : Colors.grey,
          ),
          onTap: () {
            if (isFavorited) {
              context.read<FavCubit>().deleteFavCubit(id: productModel.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from favorites'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            } else {
              context.read<FavCubit>().addFavCubit(id: productModel.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Add to favorites'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            }
          },
        );
      },
    );
  }
}
