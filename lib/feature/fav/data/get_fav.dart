import 'package:ap2/feature/home/model/product_model.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();

class GetFav {
  getFav(String id) async {
    final repo = await dio.get(
      'https://elwekala.onrender.com/favorite',
      data: {"nationalId": "01009876567876"},
    );
    final data = await repo.data['favoriteProducts'];
    print('==========================$data');
    return data;
  }
}
