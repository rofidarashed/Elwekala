import 'package:ap2/feature/details/view/widgets/custom_page_view.dart';
import 'package:ap2/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  const DetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'), centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPageView(productModel: productModel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                productModel.status == 'new'
                    ? Text(
                        productModel.status,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text('Used'),
                Text(
                  productModel.price.toString(),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(productModel.description),
          ],
        ),
      ),
    );
  }
}
