import 'package:dio/dio.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';

final Dio dio = Dio();

getData() async {
  final response = await dio.get(
    'https://elwekala.onrender.com/product/Laptops',
  );
  final data = response.data['product'];

List<dynamic> listProduct=data .map((e) => ProductModel.fromJson(e))
        .toList();
    return listProduct;
}
