// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      bankAccName: json['bank_acc_name'] as String?,
      bankAccNo: json['bank_acc_no'] as String?,
      bankName: json['bank_name'] as String?,
      bankIfsc: json['bank_ifsc'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'bank_acc_name': instance.bankAccName,
      'bank_acc_no': instance.bankAccNo,
      'bank_name': instance.bankName,
      'bank_ifsc': instance.bankIfsc,
    };
