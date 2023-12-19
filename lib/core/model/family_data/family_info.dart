import 'package:json_annotation/json_annotation.dart';

import 'guardian.dart';
import 'sibling.dart';

part 'family_info.g.dart';

@JsonSerializable()
class FamilyInfo {
	List<Guardian>? guardians;
	List<Sibling>? siblings;

	FamilyInfo({this.guardians, this.siblings});

	factory FamilyInfo.fromJson(Map<String, dynamic> json) {
		return _$FamilyInfoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$FamilyInfoToJson(this);
}
