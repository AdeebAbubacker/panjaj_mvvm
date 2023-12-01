import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'Data') 
	List<Datum>? data;
	@JsonKey(name: 'Message') 
	String? message;
	@JsonKey(name: 'NeedCount') 
	bool? needCount;
	@JsonKey(name: 'Count') 
	int? count;

	Data({this.data, this.message, this.needCount, this.count});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
