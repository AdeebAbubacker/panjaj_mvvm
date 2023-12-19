// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyInfo _$FamilyInfoFromJson(Map<String, dynamic> json) => FamilyInfo(
      guardians: (json['guardians'] as List<dynamic>?)
          ?.map((e) => Guardian.fromJson(e as Map<String, dynamic>))
          .toList(),
      siblings: (json['siblings'] as List<dynamic>?)
          ?.map((e) => Sibling.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FamilyInfoToJson(FamilyInfo instance) =>
    <String, dynamic>{
      'guardians': instance.guardians,
      'siblings': instance.siblings,
    };
