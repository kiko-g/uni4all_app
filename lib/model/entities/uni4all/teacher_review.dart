class TeacherReview {
  final String description;
  final String author;
  final String date;
  final String className;
  final String teacher;

  const TeacherReview({
    this.description,
    this.author,
    this.date,
    this.className,
    this.teacher,
  });

  factory TeacherReview.fromJson(Map<String, dynamic> json) {
    return TeacherReview(
      description: json['description'],
      author: json['author'],
      date: json['date'],
      className: json['class'],
      teacher: json['teacher'],
    );
  }
}
