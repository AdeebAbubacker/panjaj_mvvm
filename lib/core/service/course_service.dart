import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/courses/courses.dart';

class CourseService {
  Future<Courses> getCourseList({String? search}) async {
    final uri = Uri.parse('https://pt.tekpeak.in/api/course?page=1&search=$search');
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Courses courses = Courses.fromJson(jsonDecode(response.body));

        // Print each course name
        for (var course in courses.data!.data!) {
          print('Course Name: ${course.name}');
        }

        return courses;
      } else {
        throw MainFailure.clientFailure(message: response.body.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
