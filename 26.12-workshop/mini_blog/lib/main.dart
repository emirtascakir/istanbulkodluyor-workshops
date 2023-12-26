import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blog/repositories/article_repository.dart';
import 'package:mini_blog/views/home_view.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) =>
              ArticleBloc(articleRepository: ArticleRepository()))
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  ));
}
