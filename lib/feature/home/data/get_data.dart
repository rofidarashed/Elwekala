import 'package:ap2/feature/home/model/product_model.dart';
import 'package:dio/dio.dart';

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
