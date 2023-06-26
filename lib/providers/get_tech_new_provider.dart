import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/get_news_services.dart';

class GetTechNewsProvider extends ChangeNotifier {
  final getNewsService = GetNewsService();
  bool isLoading = false;

  List<NewsArticle> _newsarticles = [];
  List<NewsArticle> get news => _newsarticles;

  Future<void> getTechNews() async {
    isLoading = true;
    notifyListeners();

    final response = await getNewsService.getTechNewsFromApi();
    _newsarticles = response;
    isLoading = false;
    notifyListeners();
  }
}
