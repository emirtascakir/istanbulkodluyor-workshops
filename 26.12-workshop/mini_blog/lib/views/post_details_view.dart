import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_event.dart';
import 'package:mini_blog/blocs/article_bloc/article_state.dart';
import 'package:mini_blog/models/blog.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key, required this.post});
  final Blog post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post.title} details"),
        actions: [
          BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<ArticleBloc>().add(DeleteArticle(post.id!));
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete));
            },
          )
        ],
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
