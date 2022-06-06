import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uni/model/entities/uni4all/news.dart';
import 'package:uni/model/entities/uni4all/curritcular_unit.dart';

// FIXME: parse json for all response.body
// TODO: create types for every entity in uni4all
// return News.fromJson(jsonDecode(response.body));

class Uni4AllApi {
  static Future<String> register(String email, String password) async {
    final endpoint = 'https://uni4all.servehttp.com/authentication/register';
    final http.Response response = await http.post(Uri.parse(endpoint), body: {
      email: email,
      password: password,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register with uni4all api');
    }
  }

  static Future<String> login(String email, String password) async {
    final endpoint = 'https://uni4all.servehttp.com/authentication/login';
    final http.Response response = await http.post(Uri.parse(endpoint), body: {
      email: email,
      password: password,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login with uni4all api');
    }
  }

  static Future<String> logout() async {
    final endpoint = 'https://uni4all.servehttp.com/authentication/logout';
    final http.Response response = await http.post(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to logout with uni4all api');
    }
  }

  static Future<String> getCalendar() async {
    final endpoint = 'https://uni4all.servehttp.com/calendar';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch calendar from uni4all api');
    }
  }

  static Future<String> createCalendar(
    String summary,
    String description,
    String location,
    String date,
    String startTime,
    String endTime,
    String recurrence,
  ) async {
    final endpoint = 'https://uni4all.servehttp.com/calendar/create';
    final response = await http.post(Uri.parse(endpoint), body: {
      'summary': summary,
      'description': description,
      'location': location,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'recurrence': recurrence
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to create calendar with uni4all api');
    }
  }

  static Future<CurricularUnit> getCurricularUnit(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/curricular-unit/${id}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return CurricularUnit.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch curricular unit info from uni4all api');
    }
  }

  static Future<String> getExamsCalendar(int majorID) async {
    final endpoint = 'https://uni4all.servehttp.com/exams-calendar/${majorID}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch exams calendar from uni4all api');
    }
  }

  static Future<String> getStudentGrades(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/grades/$studentNumber';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student grades from uni4all api');
    }
  }

  static Future<String> getNews() async {
    final endpoint = 'https://uni4all.servehttp.com/news';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch news from uni4all api');
    }
  }

  static Future<String> getStudentSchedule(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/schedule/student';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student schedule from uni4all api');
    }
  }

  static Future<String> getStudentProfile(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/profile/$studentNumber';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student schedule from uni4all api');
    }
  }

  static Future<String> getStudentExams(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/student-exams/${studentNumber}';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch student exams from uni4all api');
    }
  }

  static Future<String> getParkingSpaceCapacity(int studentNumber) async {
    final endpoint = 'https://uni4all.servehttp.com/capacity';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch car parking space from uni4all api');
    }
  }

  static Future<String> deleteUser(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/$id';
    final response = await http.delete(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete user uni4all api');
    }
  }

  static Future<String> updateUserPassword(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/update-password/$id';
    final response = await http.put(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete user uni4all api');
    }
  }

  static Future<String> forgotUserPassword(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/forgot-password';
    final response = await http.put(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete user uni4all api');
    }
  }

  static Future<String> resetUserPassword(int id) async {
    final endpoint = 'https://uni4all.servehttp.com/user/reset-password';
    final response = await http.put(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete user uni4all api');
    }
  }

  // TODO: queues endpoints
  // TODO: groups endpoints
  // TODO: feedback endpoints
  // TODO: notifications endpoints
}
