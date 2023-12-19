import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'misc.dart';

part 'academic_data.g.dart';

@JsonSerializable()
class AcademicData {
	int? status;
	int? code;
	String? message;
	Data? data;
	@JsonKey(name: 'need_count') 
	bool? needCount;
	int? count;
	Misc? misc;

	AcademicData({
		this.status, 
		this.code, 
		this.message, 
		this.data, 
		this.needCount, 
		this.count, 
		this.misc, 
	});

	factory AcademicData.fromJson(Map<String, dynamic> json) {
		return _$AcademicDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AcademicDataToJson(this);
}
