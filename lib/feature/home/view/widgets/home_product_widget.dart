import 'package:ap2/feature/details/view/details_screen.dart';
import 'package:ap2/feature/fav/cubit/cubit_state.dart';
import 'package:ap2/feature/fav/cubit/fav_cubit.dart';
import 'package:ap2/feature/fav/data/add_favs.dart';
import 'package:ap2/feature/fav/model/fav_model.dart';
import 'package:ap2/feature/fav/view/fav_screen.dart';
import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductWidget extends StatelessWidget {
  final FavModel favModel;
  final AddFavs addFavs;
  final ProductModel productModel;
  const HomeProductWidget({
    super.key,
    required this.productModel,
    required this.addFavs,
    required this.favModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return GestureDetector(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(productModel.image, height: 100),
                      Text(
                        productModel.price.toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    productModel.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    productModel.description,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  InkWell(
                    child: Icon(Icons.favorite),
                    onTap: () {
                      context.read<FavCubit>().addFavCubit(productModel.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return FavScreen(favModel: favModel,productModel: productModel,);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return DetailsScreen(productModel: productModel);
              },
            ),
          ),
        );
      },
    );
  }
}
