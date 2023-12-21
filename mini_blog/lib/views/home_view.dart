import 'package:flutter/material.dart';
import 'package:mini_blog/models/blog.dart';
import 'package:mini_blog/service/api_service.dart';
import 'package:mini_blog/views/add_blog_view.dart';
import 'package:mini_blog/views/post_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _service = ApiService();
  late Future<List<Blog>> _blogPosts;

  @override
  void initState() {
    super.initState();
    _blogPosts = _service.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Blog'),
          actions: [
            IconButton(
                onPressed: () async {
                  bool? result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => AddPostView()));
                  if (result == true) {
                    initState();
                  }
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Blog>>(
          future: _blogPosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(children: [
                          Text(
                            post.title!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Image.network(post.thumbnail!),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(post.author!),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                PostDetailsView(post: post)));
                                  },
                                  child: const Text('Detaylara git'))
                            ],
                          )
                        ]),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              throw Exception('Hata: ${snapshot.error}');
            } else {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }
          },
        ));
  }
}
