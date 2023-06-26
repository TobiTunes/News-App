import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/widgets/app_bar_widget.dart';

class ArticlesScreen extends StatelessWidget {
  final NewsArticle article;
  const ArticlesScreen(
      {super.key, required this.article, required this.tabController});

  final TabController tabController;

  final IconData icon = Icons.arrow_back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(tabController, icon, false, context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                article.imageUrl!,
                width: MediaQuery.of(context).size.width,
                height: 270,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('asset/testImg.jpg'),
              ),
              // Image(
              //   image: NetworkImage(
              //     article.imageUrl,
              //   ),
              //   width: MediaQuery.of(context).size.width,
              //   height: 270,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(height: 16),
              Text(
                article.headline ?? 'Not available',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                article.timestamp ?? 'Not available',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text(
                "Author: ${article.author}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                article.content ?? 'Not available',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
