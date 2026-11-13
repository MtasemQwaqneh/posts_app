import 'package:flutter/material.dart';
import 'package:posts_app/controllar/api_provider.dart';
import 'package:posts_app/view/create_post_page.dart';
import 'package:posts_app/view/edit_post_page.dart';
import 'package:posts_app/view/home_page.dart';
import 'package:posts_app/view/post_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Home Page',
        routes: {
          '/Home Page': (context) => HomePage(),
          '/Creat Post Page': (context) => CreatePostPage(),
          '/Edit Post Page': (context) => EditPostPage(),
          '/post details': (context) => PostDetails(),
        },
      ),
    );
  }
}
