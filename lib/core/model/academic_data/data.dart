import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'student_id') 
	int? studentId;
	String? title;
	String? description;
	String? attachment;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	int? id;

	Data({
		this.studentId, 
		this.title, 
		this.description, 
		this.attachment, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
