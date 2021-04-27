import 'dart:convert';

import 'package:evalm/data/models/user.dart';
import 'package:evalm/utils/constant.dart';
import 'package:evalm/utils/jwt.utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  String url = '$API_URL/api/auth/login';

  Future<User> login(String username, String password) async {
    final storage = new FlutterSecureStorage();

    var response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    User user;
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      await storage.write(key: 'jwt-token', value: data['token']);
      Map<String, dynamic> tokenData = JwtUtils.decrypt(data['token']);
      user = User.fromMap(tokenData);
      String jsonUser = user.toJSON();
      await storage.write(key: 'user', value: jsonUser);
    }

    return user;
  }
}