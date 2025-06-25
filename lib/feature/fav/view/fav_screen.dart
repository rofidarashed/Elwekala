import 'package:ap2/feature/fav/cubit/cubit_state.dart';
import 'package:ap2/feature/fav/cubit/fav_cubit.dart';
import 'package:ap2/feature/fav/model/fav_model.dart';
import 'package:ap2/feature/fav/view/widgets/fav_item.dart';
import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavScreen extends StatelessWidget {
  final FavModel favModel;
  final ProductModel productModel;
  const FavScreen({
    super.key,
    required this.favModel,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavAddSuccess) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return FavItem(productModel: productModel);
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
