import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'courses.g.dart';

@JsonSerializable()
class SearchCourse {
	int? status;
	int? count;
	String? message;
	Data? data;
	List<dynamic>? misc;

	SearchCourse({this.status, this.count, this.message, this.data, this.misc});

	factory SearchCourse.fromJson(Map<String, dynamic> json) {
		return _$SearchCourseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SearchCourseToJson(this);
}
