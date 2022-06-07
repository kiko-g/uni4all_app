class Exam {
  final String curricularUnit;
  final String day;
  final String date;
  final String beginHour;
  final String endHour;
  final String rooms;

  const Exam({
    this.curricularUnit,
    this.day,
    this.date,
    this.beginHour,
    this.endHour,
    this.rooms,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      curricularUnit: json['curricularUnit'],
      day: json['day'],
      date: json['date'],
      beginHour: json['beginHour'],
      endHour: json['endHour'],
      rooms: json['rooms'],
    );
  }
}

class Season {
  final String name;
  final List<Exam> exams;

  const Season({
    this.name,
    this.exams,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      name: json['name'],
      exams: json['exams'],
    );
  }
}

class ExamCalendar {
  final String studentName;
  final List<Season> seasons;

  const ExamCalendar({
    this.studentName,
    this.seasons,
  });

  factory ExamCalendar.fromJson(Map<String, dynamic> json) {
    return ExamCalendar(
      studentName: json['studentName'],
      seasons: json['seasons'],
    );
  }
}