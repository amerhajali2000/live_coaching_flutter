import 'package:dio/dio.dart';
import 'package:live_coaching/models/url_user.dart';

class Authserveruser {
  Dio dio = Dio();

  registerUser(name, email, phone, password) async {
    return await dio.post(Applivecoaching().registeruser,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  loginUser(email, password) async {
    return await dio.post(Applivecoaching().loginuser,
        data: {'email': email, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
