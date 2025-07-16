import 'package:el_wekala/feature/cart/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartData {
  static final Dio dio = Dio();

  static addCart({required String productId}) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/cart/add",
      data: {
        "nationalId": "01026524572123",
        "productId": productId,
        "quantity": "1",
      },
    );
    print(response.data);
    return response.data;
  }

  static deleteCart({required String productId}) async {
    var response = await dio.delete(
      "https://elwekala.onrender.com/cart/delete",
      data: {
        "nationalId": "01026524572123",
        "productId": productId,
        "quantity": "1",
      },
    );
    return response.data;
  }

  static updateCart({
    required String productId,
    required int quantity,
  }) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/cart/update",
      data: {
        "nationalId": "01026524572123",
        "productId": productId,
        "quantity": quantity,
      },
    );
    print(response.data);
    return response.data;
  }

  static getCart() async {
    var response = await dio.get(
      "https://elwekala.onrender.com/cart/allProducts",
      data: {"nationalId": "01026524572123"},
    );
    List data = await response.data["products"];
    List<dynamic> cartList = data.map((e) => CartModel.fromJson(e)).toList();
    print("+++++++++++$cartList");
    return cartList;
  }
}
