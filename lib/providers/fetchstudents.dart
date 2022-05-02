import 'package:flutter/material.dart';
import 'package:lab15/models/.models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchStudents extends ChangeNotifier {
  final String _baseUrl = 'android-lab-13-default-rtdb.firebaseio.com';
  final List<Student> students = [];
  bool isLoading = true;
  FetchStudents() {
    fetchStudents();
  }
  Future fetchStudents() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'students.json');
    final resp = await http.get(url);
    final List<dynamic> data = json.decode(resp.body) as List<dynamic>;
    data.forEach((element) => students.add(Student.fromJson(element)));
    isLoading = false;
    notifyListeners();
  }
}
