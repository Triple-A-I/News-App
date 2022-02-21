class Article {
  late String title;
  late String publishedAt;
  late String urlToImage;
  late String description;
  Article(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.urlToImage});

  Article.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    title = json['title'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}
