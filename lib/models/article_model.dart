class ArticleModel {
  final String? image;
  final String? title;
  final String? subTilte;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subTilte,
  });

  factory ArticleModel.jsonData(json) {
    return ArticleModel(
      image: json["urlToImage"],
      title: json["title"],
      subTilte: json["description"],
    );
  }
}
