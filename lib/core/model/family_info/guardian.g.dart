// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guardian _$GuardianFromJson(Map<String, dynamic> json) => Guardian(
      name: json['name'] as String?,
      lifeStatus: json['life_status'] as int?,
      bedridden: json['bedridden'] as bool?,
      ocupation: json['ocupation'] as String?,
      income: json['income'] as int?,
      relation: json['relation'] as String?,
    );

Map<String, dynamic> _$GuardianToJson(Guardian instance) => <String, dynamic>{
      'name': instance.name,
      'life_status': instance.lifeStatus,
      'bedridden': instance.bedridden,
      'ocupation': instance.ocupation,
      'income': instance.income,
      'relation': instance.relation,
    };
