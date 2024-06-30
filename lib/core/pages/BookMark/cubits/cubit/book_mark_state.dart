part of 'book_mark_cubit.dart';

@immutable
sealed class BookMarkState {}

final class BookMarkInitial extends BookMarkState {}

final class BookMarkAddedState extends BookMarkState {}

final class BookMarkGetState extends BookMarkState {
  final List<NewsArticle> newsArticle;
  BookMarkGetState(this.newsArticle);
}

final class BookMarkRemovedState extends BookMarkState {}
