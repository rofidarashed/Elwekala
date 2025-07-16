import 'package:el_wekala/core/utils/animations/bounce_animation.dart';
import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/fav/cubit/fav_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFavIcon extends StatelessWidget {
  const CustomFavIcon({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final isFavorited = context.read<FavCubit>().isFav(productModel.id);

        return BounceAnimation(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isFavorited ? Colors.red[50] : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited ? Colors.red : Colors.grey[600],
                size: 20.sp,
              ),
            ),
            onTap: () {
              if (isFavorited) {
                context.read<FavCubit>().deleteFavCubit(id: productModel.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removed from favorites'),
                        duration: Durations.medium4,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              } else {
                context.read<FavCubit>().addFavCubit(id: productModel.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                        duration: Durations.medium4,
                    content: Text('Added to favorites'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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