import 'package:mini_blog/models/blog.dart';

abstract class ArticleState {}

class ArticlesInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;
  ArticlesLoaded({required this.blogs});
}

class ArticleAdded extends ArticleState {
  final bool isSubmitted;
  ArticleAdded({required this.isSubmitted});
}

class ArticleSubmit extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticlesError extends ArticleState {}

class ArticleDeleted extends ArticleState {
  final bool isDeleted;
  ArticleDeleted(this.isDeleted);
}
