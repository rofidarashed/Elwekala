import 'package:el_wekala/core/helper/values.dart';
import 'package:el_wekala/feature/home/data/get_data.dart';
import 'package:el_wekala/feature/profile/data/profile_model.dart';

class ProfileData {
  static profile({required String token}) async {
    final response = await dio.post(
      'https://elwekala.onrender.com/user/profile',
      data: {"token": token},
    );
    print(response.data);
    var data = await response.data['user'];
    print('Response dataaaaaaa: $data');

    var profile = ProfileModel.fromJson(data);
    print('111111111111$profile');
    return profile;
  }

  static updateProfile({required String name, required String email,required String phone}) async {
    await dio.put(
      "https://elwekala.onrender.com/user/update",
      data: {
        "token": token,
        "password": "12345678",
        "name": name,
        "email": email,
        "phone": phone,
      },
    );
  }
  static deleteProfile() async {
    await dio.delete(
      "https://elwekala.onrender.com/user/delete",
      data: {
        "token": token,
      "email":email,
      },
    );
  }
}
