import 'package:json_annotation/json_annotation.dart';

import 'family_info.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'family_info') 
	FamilyInfo? familyInfo;

	Data({this.familyInfo});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
