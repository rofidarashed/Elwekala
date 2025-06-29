import 'package:ap2/feature/cart/view/screens/cart_screen.dart';
import 'package:ap2/feature/fav/data/favs_data.dart';
import 'package:ap2/feature/fav/view/screens/fav_screen.dart';
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
          return Scaffold(
            appBar: AppBar(
              leadingWidth: double.infinity,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 4),
                  Text('Products', style: TextStyle(fontSize: 20)),
                  Spacer(flex: 3),
                  InkWell(
                    child: Icon(Icons.favorite, color: Colors.red),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return FavScreen();
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Icon(Icons.shopping_cart, color: Colors.green),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return CartScreen();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            body: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final item = state.list[index];
                return HomeProductWidget(
                  productModel: item,
                  addFavs: FavData(),
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
