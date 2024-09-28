class NewsArticlesResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsArticlesResponse({this.status, this.totalResults, this.articles});

  factory NewsArticlesResponse.fromJson(Map<String, dynamic> json) {
    return NewsArticlesResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['results'] != null
          ? List<Article>.from(json['results'].map((articleJson) => Article.fromJson(articleJson)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'results': articles?.map((article) => article.toJson()).toList(),
    };
  }
}

class Article {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creators;
  String? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? pubDateTZ;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceName;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  List<String>? country;
  List<String>? category;
  String? aiTag;

  Article({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creators,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.pubDateTZ,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceName,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      articleId: json['article_id'],
      title: json['title'],
      link: json['link'],
      keywords: json['keywords'] != null ? List<String>.from(json['keywords']) : null,
      creators: json['creator'] != null ? List<String>.from(json['creator']) : null,
      videoUrl: json['video_url'],
      description: json['description'],
      content: json['content'],
      pubDate: json['pubDate'],
      pubDateTZ: json['pubDateTZ'],
      imageUrl: json['image_url'],
      sourceId: json['source_id'],
      sourcePriority: json['source_priority'],
      sourceName: json['source_name'],
      sourceUrl: json['source_url'],
      sourceIcon: json['source_icon'],
      language: json['language'],
      country: json['country'] != null ? List<String>.from(json['country']) : null,
      category: json['category'] != null ? List<String>.from(json['category']) : null,
      aiTag: json['ai_tag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'article_id': articleId,
      'title': title,
      'link': link,
      'keywords': keywords,
      'creator': creators,
      'video_url': videoUrl,
      'description': description,
      'content': content,
      'pubDate': pubDate,
      'pubDateTZ': pubDateTZ,
      'image_url': imageUrl,
      'source_id': sourceId,
      'source_priority': sourcePriority,
      'source_name': sourceName,
      'source_url': sourceUrl,
      'source_icon': sourceIcon,
      'language': language,
      'country': country,
      'category': category,
      'ai_tag': aiTag,
    };
  }
}
