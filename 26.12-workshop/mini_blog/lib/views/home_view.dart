import 'package:flutter/material.dart';
import 'package:mini_blog/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_event.dart';
import 'package:mini_blog/blocs/article_bloc/article_state.dart';
import 'package:mini_blog/views/add_blog_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blog/widgets/blog_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Blog'),
        actions: [
          IconButton(
              onPressed: () async {
                bool? result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (builder) => const AddPostView()));
                if (result == true) {
                  initState();
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticlesInitial) {
            context.read<ArticleBloc>().add(FetchArticles());

            return const Center(
              child: Text("İstek Atılıyor.."),
            );
          }

          if (state is ArticlesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ArticlesError) {
            return const Center(
              child: Text("İstek Hatali"),
            );
          }

          if (state is ArticlesLoaded) {
            return ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  return BlogItem(
                    blog: state.blogs[index],
                  );
                });
          }

          return const Center(
            child: Text("Bilinmedik Durum"),
          );
        },
      ),
    );
  }
}
