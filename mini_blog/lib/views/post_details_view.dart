import 'package:flutter/material.dart';
import 'package:mini_blog/models/blog.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key, required this.post});
  final Blog post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post.title} details"),
      ),
      body: Column(
        children: [
          Image.network(post.thumbnail!),
          Text(
            post.title!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            post.content!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            post.author!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
