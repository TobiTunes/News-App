import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/constants.dart';
import 'package:news_app/models/news_article.dart';

class GetNewsService {
  final apiKey = Constants().apiKey;

  Future<List<NewsArticle>> getNewsFromApi({int count = 10}) async {
    String url =
        'https://newsapi.org/v2/everything?q=entertainment&apiKey=$apiKey';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> articles = json['articles'];

      // final List<NewsArticle?> newsArticles = articles
      //     .map((data) {
      //       if (data['title'] == null ||
      //           data['author'] == null ||
      //           data['publishedAt'] == null ||
      //           data['urlToImage'] == null ||
      //           data['content'] == null) {
      //         return null;
      //       }

      //       return NewsArticle(
      //         headline: data['title'],
      //         author: data['author'],
      //         timestamp: data['publishedAt'],
      //         imageUrl: data['urlToImage'],
      //         content: data['content'],
      //       );
      //     })
      //     .where((article) => article != null)
      //     .take(count)
      //     .toList();
      final newsArticles =
          articles.map((e) => NewsArticle.fromJson(e)).toList();
      final filteredNewsList =
          newsArticles.where((element) => element.imageUrl != null).toList();

      return filteredNewsList;
    } else {
      throw Exception('Error');
    }
  }

  Future<List<NewsArticle>> getBusinessNewsFromApi({int count = 10}) async {
    String urlBusiness =
        'https://newsapi.org/v2/everything?q=business&apiKey=$apiKey';

    final uri = Uri.parse(urlBusiness);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> articles = json['articles'];

      final newsArticles = articles
          .map((e) => NewsArticle.fromJson(e))
          .where((element) => element.imageUrl != null)
          .toList();

      // final List<NewsArticle?> newsArticles = articles
      //     .map((data) {
      //       if (data['title'] == null ||
      //           data['author'] == null ||
      //           data['publishedAt'] == null ||
      //           data['urlToImage'] == null ||
      //           data['content'] == null) {
      //         return null;
      //       }

      //       return NewsArticle(
      //         headline: data['title'],
      //         author: data['author'],
      //         timestamp: data['publishedAt'],
      //         imageUrl: data['urlToImage'],
      //         content: data['content'],
      //       );
      //     })
      //     .where((article) => article != null)
      //     .take(count)
      //     .toList();

      return newsArticles;
    } else {
      throw Exception('Error');
    }
  }

  Future<List<NewsArticle>> getTechNewsFromApi({int count = 10}) async {
    String urlTech =
        'https://newsapi.org/v2/everything?q=technology&apiKey=$apiKey';

    final uri = Uri.parse(urlTech);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> articles = json['articles'];

      final List<NewsArticle?> newsArticles = articles
          .map((data) {
            if (data['title'] == null ||
                data['author'] == null ||
                data['publishedAt'] == null ||
                data['urlToImage'] == null ||
                data['content'] == null) {
              return null;
            }

            return NewsArticle(
              headline: data['title'],
              author: data['author'],
              timestamp: data['publishedAt'],
              imageUrl: data['urlToImage'],
              content: data['content'],
            );
          })
          .where((article) => article != null)
          .take(count)
          .toList();

      return newsArticles.cast<NewsArticle>();
    } else {
      throw Exception('Error');
    }
  }

  Future<List<NewsArticle>> getSportsNewsFromApi({int count = 10}) async {
    String urlSports =
        'https://newsapi.org/v2/everything?q=sports&apiKey=$apiKey';

    final uri = Uri.parse(urlSports);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> articles = json['articles'];

      final List<NewsArticle?> newsArticles = articles
          .map((data) {
            if (data['title'] == null ||
                data['author'] == null ||
                data['publishedAt'] == null ||
                data['urlToImage'] == null ||
                data['content'] == null) {
              return null;
            }

            return NewsArticle(
              headline: data['title'],
              author: data['author'],
              timestamp: data['publishedAt'],
              imageUrl: data['urlToImage'],
              content: data['content'],
            );
          })
          .where((article) => article != null)
          .take(count)
          .toList();

      return newsArticles.cast<NewsArticle>();
    } else {
      throw Exception('Error');
    }
  }
}
