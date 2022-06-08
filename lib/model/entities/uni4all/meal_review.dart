class MealReview {
  final String description;
  final String author;
  final String date;
  final String restaurant;
  final String dish;
  final int rating;

  const MealReview({
    this.description,
    this.author,
    this.date,
    this.restaurant,
    this.dish,
    this.rating,
  });

  factory MealReview.fromJson(Map<String, dynamic> json) {
    return MealReview(
      description: json['description'],
      author: json['author'],
      date: json['date'],
      restaurant: json['restaurant'],
      dish: json['dish'],
      rating: json['rating'],
    );
  }
}
