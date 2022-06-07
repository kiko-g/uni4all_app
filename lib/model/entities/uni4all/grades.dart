class UC {
  final String uc;
  final String year;
  final String code;
  final String result;
  final String credits;
  final String acronym;
  final String semester;

  const UC({
    this.uc,
    this.year,
    this.code,
    this.result,
    this.credits,
    this.acronym,
    this.semester,
  });

  factory UC.fromJson(Map<String, dynamic> json) {
    return UC(
      uc: json['uc'],
      year: json['year'],
      code: json['result'],
      result: json['result'],
      credits: json['credits'],
      acronym: json['acronym'],
      semester: json['semester'],
    );
  }
}

class Grades {
  final String major;
  final List<UC> grades;

  const Grades({
    this.major,
    this.grades,
  });

  factory Grades.fromJson(Map<String, dynamic> json) {
    return Grades(
        major: json['major'],
      grades: json['grades'],
    );
  }
}