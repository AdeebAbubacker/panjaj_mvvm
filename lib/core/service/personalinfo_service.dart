import 'dart:convert';

import 'package:panakj_mvvm/core/model/personal_info/personal_info.dart';
import 'package:http/http.dart' as http;
import 'package:panakj_mvvm/core/utility/api_endpoint.dart';

class PersonalInfoService {
  String authToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODg5MDhmODE3MDc0YWVmNDExZmNhZTE2OTFiODVlZjExYTIwZDY2MDVkOThiNmY1M2MxZDg5NGMwMTcwZDFiODY3OWQyMmJmODMzODY3N2QiLCJpYXQiOjE3MDA1NTU3MDQuMDIyNzgxLCJuYmYiOjE3MDA1NTU3MDQuMDIyNzgzLCJleHAiOjE3MzIxNzgxMDQuMDIxMDEzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.St8xZXUAhdCx1bOj2-Hhx9WdwdfdZl7Z7Yfcnw3qmH3KEQLr7zyRob7jcvVSvFksB_dK7Ou6TCgVJmzq_TAcGtRd5wNeTfY9sFDAOcW9NsU2ZT7xCAsKNxO1EOOYvb5u_6sPzarMxRsPpvjryCqJwEEi1OrD0zx4eSTArDtj8mFqc7BVcz8_IgU2s6Y-2hQAgsZdMKqrrbhr2qZwnlM4kg6ViJe-0wKNmakwotmzsbOrCohnnBZTrSta0EJ4nN3F9mDSya7BCOowAXZvANPyou3sRXtaD3Thl9enUkQp2R299z2xxUP2tLBDMofJC2Px_COlc1nNq1Xa5_IAd7at9BUVdJiC1jgIcfofsJa_dBzOnywufE4JctwlieW2f49fe6LTGE_w_FquSKWaNwjDEUSx04zEA_K5ZY90ObZso3pbkKl1tEGG4OFf1SG-Iy-5GGxYmchdTx8y-ht5B3xf_ZL5mhjHimtAd2nkwUHqXSffuZMGzJEih8xxgKEMR60J--94wohavmX5L_Y7CmrEJi4tdiz1YcghKd397-mpj6TiDIdZD0fDuT2ZvpEXc20aRRLrZvBhtvrZIylPNCOaPynQ5zsqoSKj67iAA6cg8PE_d199I9Fr3eCNS2UQvVfViwcaJunYDuZdrMFzSZhFZRcHc76a5vt0rIsAY_WHESI';

  Future<PersonalInfo> personalInfo({
    required String name,
    required String gender,
    required String dob,
    required String phone,
    required String address,
    required String email,
    required String bankaccname,
    required String bankaccno,
    required String bankname,
    required String bankifsc,
  }) async {
    final uri = Uri.parse(ApiEndpoint.personalInfo);
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode({
          "name": name,
          "gender": gender,
          "dob": dob,
          "phone": phone,
          "address": address,
          "email": email,
          "bank_acc_name": bankaccname,
          "bank_acc_no": bankaccno,
          "bank_name": bankname,
          "bank_ifsc": bankifsc
        }),
      );

      if (response.statusCode == 200) {
        final personalinfo = PersonalInfo.fromJson(jsonDecode(response.body));

        // ignore: avoid_print

        return PersonalInfo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }
}
