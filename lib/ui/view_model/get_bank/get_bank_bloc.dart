import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/bank/bank.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/service/bank_service.dart';

part 'get_bank_event.dart';
part 'get_bank_state.dart';
part 'get_bank_bloc.freezed.dart';

class GetBankBloc extends Bloc<GetBankEvent, GetBankState> {
  final _getbankservice = BankService();
  GetBankBloc() : super(GetBankState.initial()) {
    on<GetBankList>(
      (event, emit) async {
        try {
          final response = await _getbankservice.getBank();
          emit(GetBankState(
            isLoading: false,
            isError: false,
            bank: response,
            successorFailure: optionOf(right(response)),
          ));
          // ignore: avoid_print
        
          // print(
          //     'my respone is ----------- ${response.data!.map((e) => e.)}');
        } catch (e) {
          emit(GetBankState(
            isLoading: false,
            isError: true,
            bank: Bank(),
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString()))),
          ));
        }
      },
    );
  }
}
