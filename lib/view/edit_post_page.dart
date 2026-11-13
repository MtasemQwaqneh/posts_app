import 'package:flutter/material.dart';
import 'package:posts_app/controllar/api_provider.dart';
import 'package:provider/provider.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    var x = context.watch<ApiProvider>();
    TextEditingController titelController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Edit Post',
          style: TextStyle(fontSize: 30, fontWeight: .bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Post Title',
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
                TextFormField(
                  controller: titelController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required title';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter post title...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Post Body',
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
                TextFormField(
                  controller: bodyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required body';
                    } else {
                      return null;
                    }
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter post title...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                  height: 60,
                  minWidth: 400,
                  color: Color(0xff3c368c),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ApiProvider>().putPost(
                        titelController.text,
                        bodyController.text,
                        id,
                        context,
                      );
                    }
                  },
                  child: Text(
                    'Save changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: .bold,
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                  ),
                ),
                x.loading
                    ? Center(child: LinearProgressIndicator())
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
