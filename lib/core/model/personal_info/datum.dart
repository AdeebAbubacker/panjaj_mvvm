import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	String? name;
	String? gender;
	String? dob;
	String? phone;
	String? address;
	String? email;
  
	@JsonKey(name: 'bank_acc_name') 
	String? bankAccName;
	@JsonKey(name: 'bank_acc_no') 
	String? bankAccNo;
	@JsonKey(name: 'bank_name') 
	String? bankName;
	@JsonKey(name: 'bank_ifsc') 
	String? bankIfsc;

	Datum({
		this.name, 
		this.gender, 
		this.dob, 
		this.phone, 
		this.address, 
		this.email, 
		this.bankAccName, 
		this.bankAccNo, 
		this.bankName, 
		this.bankIfsc, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
