import 'package:el_wekala/feature/home/data/get_data.dart';
import 'package:el_wekala/feature/profile/model/profile_model.dart';

class ProfileData {
   static profile({required String token}) async {
    final response = await dio.post(
      'https://elwekala.onrender.com/user/profile',
      data: {"token": token},
    );
    print(response.data);
  var data = await response.data['user'];
    print('Response dataaaaaaa: $data');

 var profile =  ProfileModel.fromJson(data);
    print('111111111111$profile');
    return profile;
  }
}