class News {
  final String url;
  final String title;
  final String excerpt;
  final String header;
  final String details;
  final String content;

  const News({
    this.url,
    this.title,
    this.excerpt,
    this.header,
    this.details,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      url: json['url'],
      title: json['title'],
      excerpt: json['excerpt'],
      header: json['header'],
      details: json['details'],
      content: json['content'],
    );
  }
}
