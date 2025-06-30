import 'package:el_wekala/feature/cart/view/screens/cart_screen.dart';
import 'package:el_wekala/feature/fav/view/screens/fav_screen.dart';
import 'package:el_wekala/feature/home/cubit/home_cubit.dart';
import 'package:el_wekala/feature/home/cubit/home_state.dart';
import 'package:el_wekala/feature/home/view/widgets/home_product_widget.dart';
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leadingWidth: double.infinity,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 7),
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
                  Spacer(),
                ],
              ),
            ),

            body: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final item = state.list[index];
                return HomeProductWidget(productModel: item);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 6,
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
