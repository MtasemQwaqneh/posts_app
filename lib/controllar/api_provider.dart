import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts_app/models/api_model.dart';

class ApiProvider extends ChangeNotifier {
  String url = 'https://jsonplaceholder.typicode.com';
  List<ApiModel> posts = [];

  bool loading = false;
  String erorrMeassge = '';

  Future<void> getPosts() async {
    loading = true;
    erorrMeassge = '';
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$url/posts'));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        posts = data.map((json) => ApiModel.fromJosn(json)).toList();
      } else {
        erorrMeassge = 'server erorr ${response.statusCode}';
      }
    } catch (e) {
      erorrMeassge = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  Future<void> addPost(String title, String body, BuildContext context) async {
    loading = true;
    erorrMeassge = '';
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse('$url/posts'),
        body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final newPost = ApiModel.fromJosn(data);
        posts.add(newPost);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successeful add'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        notifyListeners();
      } else {
        erorrMeassge = 'server erorr ${response.statusCode}';
      }
    } catch (e) {
      erorrMeassge = e.toString();
    }

    loading = false;

    notifyListeners();
  }

  Future<void> putPost(
    String title,
    String body,
    int id,
    BuildContext context,
  ) async {
    loading = true;
    erorrMeassge = '';
    notifyListeners();
    try {
      final response = await http.put(
        Uri.parse('$url/posts/$id'),
        body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final updatePost = ApiModel.fromJosn(data);
        final index = posts.indexWhere((post) => post.id == id);

        if (index != -1) {
          posts[index] = updatePost;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successful put',
              style: TextStyle(color: Colors.black, fontWeight: .bold),
            ),
            backgroundColor: Colors.amber,
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        erorrMeassge = 'server erorr ${response.statusCode}';
      }
    } catch (e) {
      erorrMeassge = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  Future<void> deletePost(int id, BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    loading = true;
    erorrMeassge = '';
    notifyListeners();

    try {
      final respnose = await http.delete(Uri.parse('$url/posts/$id'));
      if (respnose.statusCode == 200) {
        posts.removeWhere((post) => post.id == id);
        messenger.showSnackBar(
          SnackBar(
            content: Text('Successful delete'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      erorrMeassge = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}
