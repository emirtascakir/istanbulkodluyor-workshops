import 'package:image_picker/image_picker.dart';

abstract class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

class AddArticle extends ArticleEvent {
  final String title;
  final String content;
  final String author;
  final XFile file;
  AddArticle(
    this.title,
    this.content,
    this.author,
    this.file,
  );
}

class DeleteArticle extends ArticleEvent {
  String id;
  DeleteArticle(this.id);
}

class FetchArticle extends ArticleEvent {
  String id;
  FetchArticle(this.id);
}
