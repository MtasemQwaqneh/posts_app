import 'package:flutter/material.dart';
import 'package:posts_app/controllar/api_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApiProvider>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    var x = context.watch<ApiProvider>();
    if (x.loading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<ApiProvider>().getPosts();
          },
          icon: Icon(Icons.refresh),
        ),
        title: Text(
          'Posts Maneger',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: x.erorrMeassge.isNotEmpty
          ? Center(child: Text(x.erorrMeassge))
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Manage your posts', style: TextStyle(fontSize: 16)),
                  Card(
                    child: Text('https://jsonplaceholder.typicode.com/posts'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search posts...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: Icon(Icons.search_outlined),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                    ),
                    height: 50,
                    minWidth: 400,
                    color: Color(0xff3c368c),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Creat Post Page');
                    },
                    child: Text(
                      '+ Add Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: x.posts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: double.maxFinite,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/post details',
                                arguments: [
                                  x.posts[index].title,
                                  x.posts[index].body,
                                ],
                              );
                            },
                            leading: Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              spacing: 10,
                              children: [
                                Text('Post# ${index + 1}'),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              x.posts[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              x.posts[index].body,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Row(
                              spacing: 10,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.of(context).pushNamed(
                                    '/Edit Post Page',
                                    arguments: x.posts[index].id,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.edit, size: 20),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<ApiProvider>().deletePost(
                                      x.posts[index].id,
                                      context,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red[300],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
