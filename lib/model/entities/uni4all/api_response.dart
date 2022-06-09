class Uni4AllApiResponse {
  final bool success;
  final String message;
  final dynamic content;

  const Uni4AllApiResponse({
    this.success,
    this.message,
    this.content,
  });

  factory Uni4AllApiResponse.fromJson(Map<String, dynamic> json) {
    return Uni4AllApiResponse(
      success: json['success'],
      message: json['message'],
      content: json['content'],
    );
  }
}
