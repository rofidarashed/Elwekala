import 'package:el_wekala/core/utils/animations/fade_in_animation.dart';
import 'package:el_wekala/feature/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;
  final Function(String) onRemove;
  final Function(String, int) onQuantityChanged;

  const CartItem({
    super.key,
    required this.cartModel,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  cartModel.image,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.name,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '\$${cartModel.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, size: 18.sp),
                          onPressed: () {
                            if (cartModel.quantity > 1) {
                              onQuantityChanged(
                                  cartModel.id, (cartModel.quantity - 1).toInt(), );
                            }
                          },
                        ),
                        Text(cartModel.quantity.toString(),
                            style: TextStyle(fontSize: 14.sp)),
                        IconButton(
                          icon: Icon(Icons.add, size: 18.sp),
                          onPressed: () {
                            onQuantityChanged(
                                cartModel.id, (cartModel.quantity + 1).toInt());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onRemove(cartModel.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}