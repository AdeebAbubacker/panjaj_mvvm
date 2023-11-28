import 'package:json_annotation/json_annotation.dart';

import 'bank.dart';
import 'courses.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	List<Bank>? banks;
	List<dynamic>? occupations;
	List<dynamic>? qualifications;
	Courses? courses;

	Data({this.banks, this.occupations, this.qualifications, this.courses});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
