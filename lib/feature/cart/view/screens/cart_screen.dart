import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/cart/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CartGetState) {
          return Scaffold(
            appBar: AppBar(title: Text('Cart'), centerTitle: true),

            body: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return CartItem(cartMiodel: state.list[index]);
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
