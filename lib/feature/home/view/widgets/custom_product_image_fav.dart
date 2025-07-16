import 'package:el_wekala/core/utils/animations/scale_animation.dart';
import 'package:el_wekala/feature/fav/cubit/fav_cubit.dart';
import 'package:el_wekala/feature/fav/cubit/fav_state.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:el_wekala/core/widgets/custom_fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return ScaleAnimation(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey[100],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    productModel.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8.w,
                right: 8.w,
                child: CustomFavIcon(productModel: productModel),
              ),
            ],
          ),
        );
      },
    );
  }
}