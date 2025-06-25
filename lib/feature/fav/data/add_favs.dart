import 'package:dio/dio.dart';

final Dio dio = Dio();

class AddFavs {
  addFav(String id) async{
    final repo =await dio.post(
      'https://elwekala.onrender.com/favorite',
      data: {"nationalId": "01009876567876", "productId": id},
    );
    return repo;
  }
}
