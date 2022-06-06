class CurricularUnit {
  final String code;
  final String acronym;
  final String name;
  final String language;
  final String evaluation;
  final String workingMethod;

  const CurricularUnit({
    this.code,
    this.acronym,
    this.name,
    this.language,
    this.evaluation,
    this.workingMethod,
  });

  factory CurricularUnit.fromJson(Map<String, dynamic> json) {
    return CurricularUnit(
      code: json['code'],
      acronym: json['acronym'],
      name: json['name'],
      language: json['language'],
      evaluation: json['evaluation'],
      workingMethod: json['workingMethod'],
    );
  }
}
