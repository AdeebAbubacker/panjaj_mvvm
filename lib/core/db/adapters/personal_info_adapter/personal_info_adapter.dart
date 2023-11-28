import 'package:hive/hive.dart';
 part 'personal_info_adapter.g.dart';


@HiveType(typeId: 2)
class personalInfoDB {


  @HiveField(0)
  bool status;

  personalInfoDB({

    required this.status,
  });

  factory personalInfoDB.fromJson(Map<String, dynamic> json) {
    return personalInfoDB(

      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
   
    data['status'] = status;
    return data;
  }
}
