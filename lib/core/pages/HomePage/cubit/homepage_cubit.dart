import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/Models/article_model.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(ArticleLoadingState()) {
    fetchArticleData(
        "https://newsapi.org/v2/everything?q=apple&from=2024-06-28&to=2024-06-28&sortBy=popularity&apiKey=9214b282d43d486986ab09514e1de9e2");
    log("Bloc called");
  }

  List<NewsArticle> articleList = [];

  void fetchArticleData(url) async {
    String apiUrl = url;
    try {
      emit(ArticleLoadingState());
      final response = await http.get(Uri.parse(apiUrl));
      // log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<dynamic> articles = jsonData['articles'];
        List<NewsArticle> newsArticles =
            articles.map((article) => NewsArticle.fromJson(article)).toList();
        // log(articles.toString());
        emit(ArticleLoadedState(newsArticles));
      } else {
        // log("Failed");
        emit(ArticleLoadingErrorState('Failed to load article data'));
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleLoadingErrorState(e.toString()));
    }
  }
}
