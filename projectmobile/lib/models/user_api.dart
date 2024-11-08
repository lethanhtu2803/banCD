import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projectmobile/entities/user.dart';
import 'package:projectmobile/models/base_url.dart';

class UserAPI {
  Future<bool> login(User user) async {
    var respone = await http.post(
      Uri.parse(BaseUrl.url + "user/login"),
      body: json.encode(user.toMap()),
      headers: {"Content-Type": "application/json"},
    );
    print(respone.body);
    if (respone.statusCode == 200) {
      dynamic res = jsonDecode(respone.body);
      return res["status"];
    } else {
      throw Exception("Bad request");
    }
  }

  Future<User> findByUsername(String username) async {
    var respone = await http.get(Uri.parse(BaseUrl.url + "user/findByUsername/" + username));
    print(respone.body);
    if (respone.statusCode == 200) {
      dynamic res = jsonDecode(respone.body);
      return User.fromMap(res);
    } else {
      throw Exception("Bad request");
    }
  }
}
