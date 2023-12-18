// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyInfo _$FamilyInfoFromJson(Map<String, dynamic> json) => FamilyInfo(
      status: json['status'] as int?,
      count: json['count'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      misc: json['misc'] as List<dynamic>?,
    );

Map<String, dynamic> _$FamilyInfoToJson(FamilyInfo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
    };
