import 'dart:ffi';

class Course {
  final String acronym;
  final Int32 year;
  final Int32 credits;
  final Int32 hours;

  const Course({
    this.acronym,
    this.year,
    this.credits,
    this.hours,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      acronym: json['acronym'],
      year: json['year'],
      credits: json['credits'],
      hours: json['hours'],
    );
  }
}

class Teacher {
  final String name;

  const Teacher({
    this.name,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['name'],
    );
  }
}

class AssessmentComponent {
  final String designation;
  final Int32 weight;

  const AssessmentComponent({
    this.designation,
    this.weight
  });

  factory AssessmentComponent.fromJson(Map<String, dynamic> json) {
    return AssessmentComponent(
      designation: json['designation'],
      weight: json['weight'],
    );
  }
}

class CourseUnitTime {
  final String designation;
  final Int32 hours;

  const CourseUnitTime({
    this.designation,
    this.hours
  });

  factory CourseUnitTime.fromJson(Map<String, dynamic> json) {
    return CourseUnitTime(
      designation: json['designation'],
      hours: json['hours'],
    );
  }
}

class Student {
  final String name;
  final String number;
  final String email;
  final String allocationDate;
  final Bool enrolled;

  const Student({
    this.name,
    this.number,
    this.email,
    this.allocationDate,
    this.enrolled,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      number: json['number'],
      email: json['email'],
      allocationDate: json['allocationDate'],
      enrolled: json['enrolled'],
    );
  }
}

class Class {
  final String name;
  final List<Student> students;

  const Class({
    this.name,
    this.students
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      name: json['name'],
      students: json['students'],
    );
  }
}

class CurricularUnit {
  final String code;
  final String acronym;
  final String name;
  final List<Course> courses;
  final List<Teacher> teachers;
  final String language;
  final String objectives;
  final String outcomesAndCompetences;
  final String workingMethod;
  final String requirements;
  final String program;
  final String mandatoryLiterature;
  final String complementaryBibliography;
  final String teachingMethodsAndActivities;
  final String evaluation;
  final List<AssessmentComponent> assessmentComponents;
  final List<CourseUnitTime> courseUnitsTimes;
  final String examEligibility;
  final String calculationFormula;
  final String specialAssessment;
  final String classificationImprovement;
  final List<Class> classes;

  const CurricularUnit({
    this.code,
    this.acronym,
    this.name,
    this.courses,
    this.teachers,
    this.language,
    this.objectives,
    this.outcomesAndCompetences,
    this.workingMethod,
    this.requirements,
    this.program,
    this.mandatoryLiterature,
    this.complementaryBibliography,
    this.teachingMethodsAndActivities,
    this.evaluation,
    this.assessmentComponents,
    this.courseUnitsTimes,
    this.examEligibility,
    this.calculationFormula,
    this.specialAssessment,
    this.classificationImprovement,
    this.classes
  });

  factory CurricularUnit.fromJson(Map<String, dynamic> json) {
    return CurricularUnit(
      code: json['code'],
      acronym: json['acronym'],
      name: json['name'],
      courses: json['courses'],
      teachers: json['teachers'],
      language: json['language'],
      objectives: json['objectives'],
      outcomesAndCompetences: json['outcomesAndCompetences'],
      workingMethod: json['workingMethod'],
      requirements: json['requirements'],
      program: json['program'],
      mandatoryLiterature: json['mandatoryLiterature'],
      complementaryBibliography: json['complementaryBibliography'],
      teachingMethodsAndActivities: json['teachingMethodsAndActivities'],
      evaluation: json['evaluation'],
      assessmentComponents: json['assessmentComponents'],
      courseUnitsTimes: json['courseUnitsTimes'],
      examEligibility: json['examEligibility'],
      calculationFormula: json['calculationFormula'],
      specialAssessment: json['specialAssessment'],
      classificationImprovement: json['classificationImprovement'],
      classes: json['classes'],
    );
  }
}
