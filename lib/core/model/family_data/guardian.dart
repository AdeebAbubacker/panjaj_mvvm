import 'package:json_annotation/json_annotation.dart';

part 'guardian.g.dart';

@JsonSerializable()
class Guardian {
	String? name;
	@JsonKey(name: 'life_status') 
	int? lifeStatus;
	bool? bedridden;
	String? ocupation;
	int? income;
	String? relation;

	Guardian({
		this.name, 
		this.lifeStatus, 
		this.bedridden, 
		this.ocupation, 
		this.income, 
		this.relation, 
	});

	factory Guardian.fromJson(Map<String, dynamic> json) {
		return _$GuardianFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GuardianToJson(this);
}
