// ignore_for_file: public_member_api_docs, sort_constructors_first
class Articles {
  String? title, description, urlToImage;
  Articles({
    this.title,
    this.description,
    this.urlToImage,
  });

  Articles.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
  }
}

class ListModelNews {
  //class has List Data

  List<Articles>? articles;
  ListModelNews({
    this.articles,
  });

  ListModelNews.fromjson(Map<String, dynamic> json) {
    articles =
        (json["articles"] as List).map((e) => Articles.fromjson(e)).toList();
  }
}
