import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panakj_mvvm/core/model/bank/bank.dart';
import 'package:panakj_mvvm/core/model/failure/mainfailure.dart';
import 'package:panakj_mvvm/core/utility/api_endpoint.dart';

class BankService {
  Future<Bank> getBank() async {
    final uri = Uri.parse(ApiEndpoint.getBank);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        if (response.statusCode == 200) {
     
        }
        return Bank.fromJson(jsonDecode(response.body));
      } else {
        // print(MainFailure.clientFailure(message: response.body.toString()));
        throw MainFailure.clientFailure(message: response.body.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
