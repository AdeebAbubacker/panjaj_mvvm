import 'package:json_annotation/json_annotation.dart';

part 'sibling.g.dart';

@JsonSerializable()
class Sibling {
	String? name;
	String? gender;
	String? qualification;
	String? course;
	String? occupation;

	Sibling({
		this.name, 
		this.gender, 
		this.qualification, 
		this.course, 
		this.occupation, 
	});

	factory Sibling.fromJson(Map<String, dynamic> json) {
		return _$SiblingFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SiblingToJson(this);
}
