import 'package:el_wekala/core/utils/animations/fade_in_animation.dart';
import 'package:el_wekala/feature/cart/cubit/cart_cubit.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/cart/model/cart_model.dart';
import 'package:el_wekala/feature/cart/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(duration: Durations.medium4, content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();

        if (state is CartLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartGetState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Your Cart',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                if (state.list.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _showClearCartDialog(context, cartCubit),
                  ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: state.list.isEmpty
                      ? _buildEmptyCart()
                      : RefreshIndicator(
                          onRefresh: () async => await cartCubit.getCart(),
                          child: ListView.builder(
                            padding: EdgeInsets.all(16.r),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: CartItem(
                                  cartModel: state.list[index],
                                  onRemove: (productId) =>
                                      cartCubit.deleteCartItem(productId),
                                  onQuantityChanged:
                                      (productId, quantity) =>
                                          cartCubit.updateCartItem(
                                            productId,
                                            quantity,
                                          ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
                if (state.list.isNotEmpty) _buildCheckoutSection(state),
              ],
            ),
          );
        }
        return Center(child: Text('Error loading cart'));
      },
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 60.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16.h),
          Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 8.h),
          Text(
            'Browse products and add items to get started',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(CartGetState state) {
    final total = state.list.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal:', style: TextStyle(fontSize: 16.sp)),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog(BuildContext context, CartCubit cartCubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: const Text(
          'Are you sure you want to remove all items from your cart?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // TextButton(
          //   onPressed: () {
          //     cartCubit.clearCart();
          //     Navigator.pop(context);
          //   },
          // child: const Text('Clear', style: TextStyle(color: Colors.red)),
          // ),
        ],
      ),
    );
  }
}
