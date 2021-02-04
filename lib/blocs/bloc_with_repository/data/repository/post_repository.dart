import 'dart:convert';

import 'package:flutter_state_management/blocs/bloc_with_repository/data/model/post.dart';
import 'package:http/http.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
}

class PostRepositoryImpl extends PostRepository {
  @override
  Future<List<Post>> getAllPosts() async {
    final response = await get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception('Can not load posts');
    }
  }
}
