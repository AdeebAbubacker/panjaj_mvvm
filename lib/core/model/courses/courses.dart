import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'courses.g.dart';

@JsonSerializable()
class Courses {
  int? status;
  int? count;
  String? message;
  Data? data;
  List<dynamic>? misc;

  Courses({this.status, this.count, this.message, this.data, this.misc});

  factory Courses.fromJson(Map<String, dynamic> json) {
    return _$CoursesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoursesToJson(this);
}
