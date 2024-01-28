class NewsArticle {
  final String? sourceId;
  final String sourceName;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  NewsArticle({
    this.sourceId,
    required this.sourceName,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      sourceId: json['source'] != null ? json['source']['id'] : null,
      sourceName: json['source']['name'] ?? "",
      author: json['author'],
      title: json['title'] ?? "",
      description: json['description'],
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'],
    );
  }
}
