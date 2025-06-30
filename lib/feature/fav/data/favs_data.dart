import 'package:el_wekala/feature/home/model/product_model.dart';
import 'package:dio/dio.dart';

class FavData {
  static final Dio dio = Dio();

  static addFav({required String id}) async {
    var response = await dio.post(
      'https://elwekala.onrender.com/favorite',
      data: {"nationalId": "01009876567876", "productId": id},
    );
    print(response.data);
    return response.data;
  }
   static deleteFav({required String id}) async {
   var response = await dio.delete(
      'https://elwekala.onrender.com/favorite',
      data: {"nationalId": "01009876567876", "productId": id},
    );
    print(response.data);
    return response.data;
  }
  static getFav() async {
    final response = await dio.get(
      'https://elwekala.onrender.com/favorite',
      data: {"nationalId": "01009876567876"},
    );
    print(response.data);
    List data = await response.data['favoriteProducts'];
    print('Response dataaaaaaa: $data');

    List<dynamic> favList = data.map((e) => ProductModel.fromJson(e)).toList();
    print('111111111111$favList');
    return favList;
  }
}
