import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'paginate.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank {
	int? status;
	int? count;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	Paginate? paginate;

	Bank({
		this.status, 
		this.count, 
		this.message, 
		this.data, 
		this.misc, 
		this.paginate, 
	});

	factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

	Map<String, dynamic> toJson() => _$BankToJson(this);
}
