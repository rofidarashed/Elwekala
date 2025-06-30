import 'package:el_wekala/core/widgets/custom_price.dart';
import 'package:el_wekala/core/widgets/custom_status.dart';
import 'package:el_wekala/feature/details/view/widgets/bottom_buttons.dart';
import 'package:el_wekala/feature/details/view/widgets/custom_page_view.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPageView(productModel: productModel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Price(productModel: productModel),
              ],
            ),
            SizedBox(height: 20),
            Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              productModel.description,
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Status(productModel: productModel),
              ],
            ),
            Spacer(),
            CustomDetailsBottomButtons(productModel: productModel),
          ],
        ),
      ),
    );
  }
}
