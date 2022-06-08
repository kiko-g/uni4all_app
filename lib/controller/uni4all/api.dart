import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
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
      throw Exception('Failed to register with uni4all api. $sc: $message');
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
      throw Exception('Failed to login with uni4all api. $sc: $message');
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
      throw Exception('Failed to logout with uni4all api. $sc: $message');
    }
  }

  static Future<CurricularUnit> getCurricularUnit(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/curricular-unit/${id}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return CurricularUnit.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch curricular unit info from uni4all api');
    }
  }

  // TODO:
  /// Returns
  static Future<String> getExamsCalendar(int majorID) async {
    final endpoint = 'https://uni4all.servehttp.com/exams-calendar/${majorID}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch exams calendar from uni4all api');
    }
  }

  /// Return the student's [Grades]
  static Future<String> getStudentGrades(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/grades/$studentNumber';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student grades from uni4all api');
    }
  }

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
      throw Exception('Failed to fetch news from uni4all api');
    }
  }

  /// Returns the student's [Schedule]
  static Future<String> getStudentSchedule(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/schedule/student';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student schedule from uni4all api');
    }
  }

  /// Returns the student's [Profile]
  static Future<String> getStudentProfile(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/profile/$studentNumber';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student schedule from uni4all api');
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
      throw Exception('Failed to fetch student exams from uni4all api');
    }
  }

  /// Returns instance of [ParkingCapacity] with car parking stats
  static Future<ParkingCapacity> getParkingSpaceCapacity() async {
    final endpoint = 'https://uni4all.servehttp.com/capacity';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return ParkingCapacity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch car parking space from uni4all api');
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
      throw Exception('Failed to delete user uni4all api');
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
      throw Exception('Failed to delete user uni4all api');
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
      throw Exception('Failed to delete user uni4all api');
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
      throw Exception('Failed to delete user uni4all api');
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
      throw Exception('Failed to fetch calendar from uni4all api');
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
      throw Exception('Failed to create calendar with uni4all api');
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
      throw Exception('Failed to create meal review with uni4all api. ($sc)');
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
          'Failed to create teacher review with uni4all api. ($sc)');
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
      throw Exception('Failed to get meal review with uni4all api. ($sc)');
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
      throw Exception('Failed to get teacher review with uni4all api. ($sc)');
    }
  }

  // TODO: queues endpoints
  // TODO: groups endpoints
  // TODO: notifications endpoints
}
