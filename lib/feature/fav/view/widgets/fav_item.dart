import 'package:ap2/feature/fav/cubit/fav_cubit.dart';
import 'package:ap2/feature/fav/cubit/fav_state.dart';
import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavItem extends StatelessWidget {
  final ProductModel favModel;
  const FavItem({super.key, required this.favModel,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return Row(
          children: [
            Image.network(favModel.image, height: 100, width: 50),
            Text(favModel.name),
            Spacer(),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () => context.read<FavCubit>().deleteFavCubit(id: favModel.id),
            )
          ],
        );
      },
    );
  }
}
