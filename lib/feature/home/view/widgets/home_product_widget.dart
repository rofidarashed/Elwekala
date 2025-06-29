import 'package:ap2/feature/cart/cubit/cart_cubit.dart';
import 'package:ap2/feature/details/view/details_screen.dart';
import 'package:ap2/feature/fav/cubit/fav_state.dart';
import 'package:ap2/feature/fav/cubit/fav_cubit.dart';
import 'package:ap2/feature/fav/data/favs_data.dart';
import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductWidget extends StatelessWidget {
  final FavData addFavs;
  final ProductModel productModel;
  const HomeProductWidget({
    super.key,
    required this.productModel,
    required this.addFavs,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final isFavorited = context.read<FavCubit>().isFav(productModel.id);

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
                      Image.network(
                        productModel.image,
                        height: 70,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.red : Colors.grey,
                        ),
                        onTap: () {
                          if (isFavorited) {
                            context.read<FavCubit>().deleteFavCubit(
                              id: productModel.id,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Removed from favorites')),
                            );
                          } else {
                            context.read<FavCubit>().addFavCubit(
                              id: productModel.id,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Add to favorites')),
                            );
                          }
                        },
                      ),
                      InkWell(
                        child: Icon(Icons.shopping_cart, color: Colors.green),
                        onTap: () {
                          context.read<CartCubit>().addCartCubit(
                            productId: productModel.id,
                          );
                        },
                      ),
                    ],
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
