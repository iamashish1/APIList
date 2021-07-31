import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/post.dart';

class PostServices {
  String url = 'jsonplaceholder.typicode.com';
  List body = [];
  var response;
  Iterable<Post> postList = [];

  Future<List<Post>> fetchPost({String query}) async {
    final response = await http.get(Uri.https(url, 'posts'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Album.fromJson(jsonDecode(response.body));
      body = json.decode(response.body);
      postList = body.map((data) => Post.fromJson(data)).toList();
      if (query != null) {
        postList = postList
            .where((element) => element.userId.contains(query))
            .toList();
      }

      return postList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load users');
    }
  }
}
