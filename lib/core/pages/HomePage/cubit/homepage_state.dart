part of 'homepage_cubit.dart';

@immutable
sealed class HomepageState {}

final class HomepageInitial extends HomepageState {}

final class ArticleLoadingState extends HomepageState {}

final class ArticleLoadedState extends HomepageState {
  final List<NewsArticle> newsArticle;
  ArticleLoadedState(this.newsArticle);
}

final class ArticleLoadingErrorState extends HomepageState {
  final String error;
  ArticleLoadingErrorState(this.error);
}
