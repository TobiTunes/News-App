class NewsArticle {
  final String? headline;
  final String? timestamp;
  final String? author;
  final String? imageUrl;
  final String? content;

  NewsArticle({
    this.headline,
    this.timestamp,
    this.author,
    this.imageUrl,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      headline: json['title'],
      timestamp: json['publishedAt'],
      author: json['author'],
      imageUrl: json['urlToImage'],
      content: json['content'],
    );
  }
}
