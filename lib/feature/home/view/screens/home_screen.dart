import 'package:ap2/feature/fav/data/add_favs.dart';
import 'package:ap2/feature/fav/model/fav_model.dart';
import 'package:ap2/feature/home/cubit/home_cubit.dart';
import 'package:ap2/feature/home/cubit/home_state.dart';
import 'package:ap2/feature/home/view/widgets/home_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccess) {
          final FavModel favModel = FavModel(image: '', name: '', description: '');
          return Scaffold(
            appBar: AppBar(title: Text('Products')),
            body: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final item = state.list[index];
                return HomeProductWidget(
                  productModel: item,
                  addFavs: AddFavs(),
                  favModel: favModel,
                );
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
