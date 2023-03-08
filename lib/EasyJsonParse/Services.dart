// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:http/http.dart' as http;

import 'Users.dart';

class Services {
  static Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  static Future<List<UsersResponseModel>> getUsers() async {
    List<UsersResponseModel> users = [];
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        users = usersResponseModelFromJson(response.body);
        return users;
      } else {
        return users;
      }
    } catch (error) {
      return users;
    }
  }
}
