import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:uni/model/entities/uni4all/group.dart';
import 'package:uni/model/entities/uni4all/meal_review.dart';
import 'package:uni/model/entities/uni4all/news.dart';
import 'package:uni/model/entities/uni4all/curricular_unit.dart';
import 'package:uni/model/entities/uni4all/parking_capacity.dart';
import 'package:uni/model/entities/uni4all/profile.dart';
import 'package:uni/model/entities/uni4all/exam_calendar.dart';
import 'package:uni/model/entities/uni4all/calendar.dart';
import 'package:uni/model/entities/uni4all/grades.dart';
import 'package:uni/model/entities/uni4all/teacher_review.dart';

class Uni4AllApi {
  /// Returns [true] if successfully tested auth
  static Future<bool> testAuthentication(String token) async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/authentication';
    final http.Response response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return true;
    } else {
      final sc = response.statusCode;
      final message = json.decode(response.body).message;
      throw Exception('Test authentication failed. $sc: $message');
    }
  }

  /// Returns [true] if account is successfully registered
  static Future<bool> register(String email, String password) async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/authentication/register';
    final http.Response response = await http.post(Uri.parse(endpoint), body: {
      email: email,
      password: password,
    });

    if (response.statusCode == 201) {
      return true;
    } else {
      final sc = response.statusCode;
      final message = json.decode(response.body).message;
      throw Exception('Failed to register with uni4all API. $sc: $message');
    }
  }

  /// Returns [true] if login action is successful
  static Future<bool> login(String email, String password) async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/authentication/login';
    final http.Response response = await http.post(Uri.parse(endpoint), body: {
      email: email,
      password: password,
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      final sc = response.statusCode;
      final message = json.decode(response.body).message;
      throw Exception('Failed to login with uni4all API. $sc: $message');
    }
  }

  /// Returns [true] if logout action is successful
  static Future<bool> logout() async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/authentication/logout';
    final http.Response response = await http.post(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return true;
    } else {
      final sc = response.statusCode;
      final message = json.decode(response.body).message;
      throw Exception('Failed to logout with uni4all API. $sc: $message');
    }
  }

  static Future<CurricularUnit> getCurricularUnit(int occurrenceId) async {
    final endpoint =
        'https://uni4all.servehttp.com/curricular-unit/${occurrenceId}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return CurricularUnit.fromJson(json.decode(response.body));
    } else {
      final sc = response.statusCode;
      throw Exception(
          'Failed to get curricular unit info from uni4all API. ($sc)');
    }
  }

  /// Returns Sigarra URL [String] with curricular unit occurrence
  static Future<String> getCurricularUnitURL(int occurrenceId) async {
    final endpoint =
        'https://uni4all.servehttp.com/curricular-unit/${occurrenceId}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get course info from uni4all API. ($sc)');
    }
  }

  /// Returns [ExamCalendar]
  static Future<String> getExamsCalendar(int majorId) async {
    // FIXME: array of exams
    final endpoint = 'https://uni4all.servehttp.com/exams-calendar/${majorId}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get exams calendar from uni4all API. ($sc)');
    }
  }

  /// Returns Sigarra URL [String] with exams calendar
  static Future<String> getExamsCalendarURL(int majorId) async {
    final endpoint =
        'https://uni4all.servehttp.com/exams-calendar/${majorId}/url';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get exams calendar from uni4all API. ($sc)');
    }
  }

  /// Return the student's [Grades]
  static Future<List<Grades>> getStudentGrades(int studentNumber) async {
    // FIXME: array grades stuff
    final endpoint = 'https://uni4all.servehttp.com/grades/$studentNumber';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List<Grades> parsed = [];
      final List<dynamic> gradesList = json.decode(response.body);
      gradesList
          .forEach((elem) => parsed.add(Grades.fromJson(json.decode(elem))));
      return parsed;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get student grades from uni4all API. ($sc)');
    }
  }

  /// Returns [Group] with groupId provided if it exists
  static Future<Group> getGroup(int groupId) async {
    final endpoint = 'https://uni4all.servehttp.com/groups/$groupId';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return Group.fromJson(json.decode(response.body));
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get group from uni4all API. ($sc)');
    }
  }

  /// Returns [List<Group>] with all existing groups
  static Future<List<Group>> getGroups() async {
    final endpoint = 'https://uni4all.servehttp.com/groups';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List<Group> parsed = [];
      final List<dynamic> groupList = json.decode(response.body);
      groupList
          .forEach((elem) => parsed.add(Group.fromJson(json.decode(elem))));
      return parsed;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get groups from uni4all API. ($sc)');
    }
  }

  /// Returns [true] if successfully updated group with value groupId
  static Future<bool> updateGroup(int groupId, Group newGroup) async {
    final endpoint = 'https://uni4all.servehttp.com/groups';
    final response = await http.patch(Uri.parse(endpoint), body: newGroup);

    if (response.statusCode == 200) {
      return true;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get news from uni4all API. ($sc)');
    }
  }

  // TODO: groups endpoints

  /// Return a [List] of [News]
  static Future<List<News>> getNews() async {
    final endpoint = 'https://uni4all.servehttp.com/news';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List<News> parsed = [];
      final List<dynamic> newsList = json.decode(response.body);
      newsList.forEach((elem) => parsed.add(News.fromJson(json.decode(elem))));
      return parsed;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get news from uni4all API. ($sc)');
    }
  }

  /// Returns the student's [Schedule]
  static Future<String> getStudentSchedule(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/schedule/student';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get student schedule from uni4all API. ($sc)');
    }
  }

  /// Returns the student's [Profile]
  static Future<String> getStudentProfile(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/profile/$studentNumber';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get student schedule from uni4all API. ($sc)');
    }
  }

  /// Returns the student's [List] of [Exam]
  static Future<String> getStudentExams(int studentNumber) async {
    final endpoint =
        'https://uni4all.servehttp.com/student-exams/${studentNumber}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get student exams from uni4all API. ($sc)');
    }
  }

  /// Returns instance of [ParkingCapacity] with car parking stats
  static Future<ParkingCapacity> getParkingSpaceCapacity() async {
    final endpoint = 'https://uni4all.servehttp.com/capacity';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return ParkingCapacity.fromJson(json.decode(response.body));
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get car parking stats from uni4all API.($sc)');
    }
  }

  // TODO:
  /// Returns
  static Future<String> deleteUser(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/$id';
    final response = await http.delete(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to delete user uni4all API. ($sc)');
    }
  }

  // TODO:
  /// Returns
  static Future<String> updateUserPassword(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/update-password/$id';
    final response = await http.put(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to delete user uni4all API. ($sc)');
    }
  }

  /// Returns []
  // TODO:
  static Future<String> forgotUserPassword(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/forgot-password';
    final response = await http.put(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to delete user uni4all API. ($sc)');
    }
  }

  // TODO:
  /// Returns
  static Future<String> resetUserPassword(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/reset-password';
    final response = await http.put(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to delete user uni4all API. ($sc)');
    }
  }

  /// Returns
  static Future<String> getCalendar() async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/calendar';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get calendar from uni4all API. ($sc)');
    }
  }

  /// Returns
  static Future<String> createCalendar() async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/calendar/create';
    final response = await http.post(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to create calendar with uni4all API. ($sc)');
    }
  }

  /// Returns [true] if meal review was added
  static Future<bool> createMealReview(MealReview mealReview) async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/feedback/meal';
    final response =
        await http.post(Uri.parse(endpoint), body: json.encode(mealReview));

    if (response.statusCode == 200) {
      return true;
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to create meal review with uni4all API. ($sc)');
    }
  }

  /// Returns [true] if teacher review was added
  static Future<bool> createTeacherReview(TeacherReview teacherReview) async {
    // FIXME:
    final endpoint = 'https://uni4all.servehttp.com/feedback/meal';
    final response =
        await http.post(Uri.parse(endpoint), body: json.encode(teacherReview));

    if (response.statusCode == 200) {
      return true;
    } else {
      final sc = response.statusCode;
      throw Exception(
          'Failed to create teacher review with uni4all API. ($sc)');
    }
  }

  /// Returns [MealReview] instance with specified parameters
  static Future<MealReview> getMealReview(MealReview mealReview) async {
    // FIXME: parse arrays of meal reviews
    final response = await http.get(Uri.https('https://uni4all.servehttp.com',
        '/feedback/teacher', json.decode(mealReview.toString())));

    if (response.statusCode == 200) {
      return MealReview.fromJson(json.decode(response.body));
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get meal review with uni4all API. ($sc)');
    }
  }

  /// Returns [TeacherReview] instance with specified parameters
  static Future<TeacherReview> getTeacherReview(
      TeacherReview teacherReview) async {
    // FIXME: parse arrays of teacher reviews
    final response = await http.get(Uri.https('https://uni4all.servehttp.com',
        '/feedback/teacher', json.decode(teacherReview.toString())));

    if (response.statusCode == 200) {
      return TeacherReview.fromJson(json.decode(response.body));
    } else {
      final sc = response.statusCode;
      throw Exception('Failed to get teacher review with uni4all API. ($sc)');
    }
  }

  // TODO: notifications endpoints

  // TODO: queues endpoints
}
