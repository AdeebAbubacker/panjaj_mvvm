import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'family_info.g.dart';

@JsonSerializable()
class FamilyInfo {
	int? status;
	int? count;
	String? message;
	Data? data;
	List<dynamic>? misc;

	FamilyInfo({this.status, this.count, this.message, this.data, this.misc});

	factory FamilyInfo.fromJson(Map<String, dynamic> json) {
		return _$FamilyInfoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$FamilyInfoToJson(this);
}
