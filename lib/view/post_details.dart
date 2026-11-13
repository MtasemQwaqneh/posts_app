import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dataList = ModalRoute.of(context)!.settings.arguments as List<String>;
    final title = dataList[0];
    final body = dataList[1];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(title, style: TextStyle(fontSize: 20, fontWeight: .bold)),
          subtitle: Text(body),
        ),
      ),
    );
  }
}
