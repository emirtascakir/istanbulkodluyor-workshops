import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_state.dart';
import 'package:mini_blog/models/blog.dart';
import 'package:mini_blog/views/post_details_view.dart';

import '../blocs/article_bloc/article_event.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    child: Image.network(blog.thumbnail!))),
            ListTile(
                title: Text(blog.title!),
                subtitle: Text(blog.author!),
                trailing: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    return TextButton(
                        onPressed: () {
                          context
                              .read<ArticleBloc>()
                              .add(FetchArticle(blog.id!));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) =>
                                  PostDetailsView(post: blog)));
                        },
                        child: const Text("Detayları gör"));
                  },
                ))
          ]),
        ),
      ),
    );
  }
}
