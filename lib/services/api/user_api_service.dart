import 'dart:convert';

import 'package:http/http.dart';
import 'package:ny_transit/data/models/user_model.dart';
import 'package:ny_transit/services/api/constants/api_constants.dart';

class UserApiService {
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(UserApiConstants().endpoint));
    if (response.statusCode == 200) {
      final List users = jsonDecode(response.body);
      return users.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
