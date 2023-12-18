import 'dart:convert';

import 'package:panakj_app/core/model/family_info/family_info.dart';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/utility/api_endpoint.dart';

class FamilyInfoService {
  String authToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODg5MDhmODE3MDc0YWVmNDExZmNhZTE2OTFiODVlZjExYTIwZDY2MDVkOThiNmY1M2MxZDg5NGMwMTcwZDFiODY3OWQyMmJmODMzODY3N2QiLCJpYXQiOjE3MDA1NTU3MDQuMDIyNzgxLCJuYmYiOjE3MDA1NTU3MDQuMDIyNzgzLCJleHAiOjE3MzIxNzgxMDQuMDIxMDEzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.St8xZXUAhdCx1bOj2-Hhx9WdwdfdZl7Z7Yfcnw3qmH3KEQLr7zyRob7jcvVSvFksB_dK7Ou6TCgVJmzq_TAcGtRd5wNeTfY9sFDAOcW9NsU2ZT7xCAsKNxO1EOOYvb5u_6sPzarMxRsPpvjryCqJwEEi1OrD0zx4eSTArDtj8mFqc7BVcz8_IgU2s6Y-2hQAgsZdMKqrrbhr2qZwnlM4kg6ViJe-0wKNmakwotmzsbOrCohnnBZTrSta0EJ4nN3F9mDSya7BCOowAXZvANPyou3sRXtaD3Thl9enUkQp2R299z2xxUP2tLBDMofJC2Px_COlc1nNq1Xa5_IAd7at9BUVdJiC1jgIcfofsJa_dBzOnywufE4JctwlieW2f49fe6LTGE_w_FquSKWaNwjDEUSx04zEA_K5ZY90ObZso3pbkKl1tEGG4OFf1SG-Iy-5GGxYmchdTx8y-ht5B3xf_ZL5mhjHimtAd2nkwUHqXSffuZMGzJEih8xxgKEMR60J--94wohavmX5L_Y7CmrEJi4tdiz1YcghKd397-mpj6TiDIdZD0fDuT2ZvpEXc20aRRLrZvBhtvrZIylPNCOaPynQ5zsqoSKj67iAA6cg8PE_d199I9Fr3eCNS2UQvVfViwcaJunYDuZdrMFzSZhFZRcHc76a5vt0rIsAY_WHESI';

  Future<FamilyInfo> familyInfo({
required final String name,
      required final String relation,
      required final String phone,
      required final String email,
     
      required final String highest_qualification,
      required final String occupation,
      required final String income,
      required final String alive,
      required final String disabled,
      required final String  siblingname,
   required final String    siblinggender,
    required final String  siblingsqualification,
     required final String  siblingscourse,
    required final String  siblingsoccuptaion,
  }) async {
    final uri = Uri.parse(ApiEndpoint.familyinfo);
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode({
          "name": "Rishi",
          "relation": "son",
          "phone": "320",
          "email": "sfh@gmail.com",
          "dob": "2022-10-03",
          "highest_qualification": "mca",
          "occupation": "farmer",
          "income": "345",
          "alive": "1",
          "disabled": "1",
          "siblings[0][name]": "dgg",
          "siblings[0][gender]": "f",
          "siblings[0][highest_qualification]": "4",
          "siblings[0][course]": "3",
          "siblings[0][occupation]": "2"
        }),
      );

      if (response.statusCode == 200) {
        return FamilyInfo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }
}
