import 'package:flutter/material.dart';
import 'package:news_app/screens/articles_screen.dart';
import 'package:provider/provider.dart';

import '../providers/get_business_new_provider.dart';
import '../providers/get_news_provider.dart';
import '../providers/get_sports_new_provider.dart';
import '../providers/get_tech_new_provider.dart';
import 'news_item_widget.dart';

class MyTabBarView extends StatefulWidget {
  final TabController tabController;

  const MyTabBarView({super.key, required this.tabController});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetNewsProvider>(context, listen: false).getNews();
      Provider.of<GetBusinessNewsProvider>(context, listen: false)
          .getBusinessNews();
      Provider.of<GetTechNewsProvider>(context, listen: false).getTechNews();
      Provider.of<GetSportsNewsProvider>(context, listen: false)
          .getSportsNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: widget.tabController, children: <Widget>[
      Consumer<GetNewsProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: ListView.builder(
            itemCount: value.news.length,
            itemBuilder: (context, index) {
              final news = value.news[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticlesScreen(
                            article: news,
                            tabController: widget.tabController))),
                child: NewsItemWidget(
                  article: news,
                ),
              );
            },
          ),
        );
      }),
      Consumer<GetBusinessNewsProvider>(builder: (context, value, child) {
        return Center(
          child: ListView.builder(
            itemCount: value.news.length,
            itemBuilder: (context, index) {
              final news = value.news[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticlesScreen(
                            article: news,
                            tabController: widget.tabController))),
                child: NewsItemWidget(
                  article: news,
                ),
              );
            },
          ),
        );
      }),
      Consumer<GetTechNewsProvider>(builder: (context, value, child) {
        return Center(
          child: ListView.builder(
            itemCount: value.news.length,
            itemBuilder: (context, index) {
              final news = value.news[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticlesScreen(
                            article: news,
                            tabController: widget.tabController))),
                child: NewsItemWidget(
                  article: news,
                ),
              );
            },
          ),
        );
      }),
      Consumer<GetSportsNewsProvider>(builder: (context, value, child) {
        return Center(
          child: ListView.builder(
            itemCount: value.news.length,
            itemBuilder: (context, index) {
              final news = value.news[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticlesScreen(
                            article: news,
                            tabController: widget.tabController))),
                child: NewsItemWidget(
                  article: news,
                ),
              );
            },
          ),
        );
      }),
    ]);
  }
}
