import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_event.dart';
import 'package:mini_blog/blocs/article_bloc/article_state.dart';
import 'package:mini_blog/repositories/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;
  ArticleBloc({required this.articleRepository}) : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetchArticles);
    on<AddArticle>(_onAdd);
    on<DeleteArticle>(_onDelete);
    on<FetchArticle>(_onFetchArticle);
  }

  void _onFetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticlesLoading());
    final blogList = await articleRepository.fetchBlogs();
    emit(ArticlesLoaded(blogs: blogList));
  }

  void _onAdd(AddArticle event, Emitter<ArticleState> emit) async {
    if (event is ArticleSubmit) {
      emit(ArticleLoading());
      final isSubmitted = await articleRepository.submitPost(
          event.title, event.content, event.author, event.file);
      emit(ArticleAdded(isSubmitted: isSubmitted));
    }
  }

  void _onDelete(DeleteArticle event, Emitter<ArticleState> emit) async {
    emit(ArticlesInitial());
    final isDeleted = await articleRepository.deletePost(event.id);
    emit(ArticleDeleted(isDeleted));
  }

  void _onFetchArticle(FetchArticle event, Emitter<ArticleState> emit) async {}
}
