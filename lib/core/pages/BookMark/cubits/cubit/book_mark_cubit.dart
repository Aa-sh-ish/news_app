import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/Models/article_model.dart';

part 'book_mark_state.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitial()) {
    getBookMarks();
  }
  List<NewsArticle> newsArticles = [];

  void addToBookMark(NewsArticle newsArticle) {
    log("add called");
    if (!newsArticles.any((article) => article.title == newsArticle.title)) {
      newsArticles.add(newsArticle);
      log(newsArticle.toString());
      emit(BookMarkAddedState());
      emit(BookMarkGetState(List.from(newsArticles)));
    }
  }

  void getBookMarks() {
    log("get called");
    emit(BookMarkGetState(List.from(newsArticles)));
    log(newsArticles.toString());
  }

  void removeBookMark(String articleName) {
    log("remove called");
    newsArticles.removeWhere((article) => article.source?.name == articleName);
    emit(BookMarkRemovedState());
    emit(BookMarkGetState(List.from(newsArticles)));
    log(newsArticles.toString());
  }

  bool isBookmarked(String articleName) {
    return newsArticles.any((article) => article.source?.name == articleName);
  }
}
