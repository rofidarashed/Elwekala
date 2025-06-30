import 'package:el_wekala/feature/details/view/screen/details_screen.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_price_cart.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_product_image_fav.dart';
import 'package:el_wekala/feature/home/view/widgets/custom_product_name.dart';
import 'package:flutter/material.dart';

class HomeProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const HomeProductWidget({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color.fromARGB(255, 235, 230, 230), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomProductImage(productModel: productModel),
              ProductNameStatus(productModel: productModel),
              Text(
                productModel.description,
                style: TextStyle(overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              SizedBox(height: 10),
              CustomPriceAndCartIcon(productModel: productModel),
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
  }
}
