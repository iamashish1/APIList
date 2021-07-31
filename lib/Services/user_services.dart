import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/user.dart';

class UserServices {
  String url = 'jsonplaceholder.typicode.com';
  List body = [];
  var response;
  Iterable<User> userList = [];

  Future<User> deleteUser(String id) async {
    final response = await http.delete(
      Uri.https(url, 'users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(id);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }

  Future<List<User>> fetchUser({String query}) async {
    final response = await http.get(Uri.https(url, 'users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Album.fromJson(jsonDecode(response.body));
      body = json.decode(response.body);
      userList = body.map((data) => User.fromJson(data)).toList();
      if (query != null) {
        userList = userList.where((element) => element.id == query).toList();
      }

      return userList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load users');
    }
  }
}
