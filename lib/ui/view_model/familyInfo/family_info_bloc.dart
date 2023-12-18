import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/family_info/family_info.dart';
import 'package:panakj_app/core/service/family_service.dart';

part 'family_info_event.dart';
part 'family_info_state.dart';
part 'family_info_bloc.freezed.dart';

class FamilyInfoBloc extends Bloc<FamilyInfoEvent, FamilyInfoState> {
  final familyInfoservice = FamilyInfoService();
  FamilyInfoBloc() : super(FamilyInfoState.initial()) {
    on<PostFamilyInfo>((event, emit) async {
      try {
        final response = await familyInfoservice.familyInfo(
            name: "Rishi",
            relation: "son",
            phone: "3534",
            email: "sfh@gmail.com",
            highest_qualification: "mca",
            occupation: "farmer",
            income: "345",
            alive: "1",
            disabled: "1",
            siblingname: "dgg",
            siblinggender: "f",
            siblingsqualification: "4",
            siblingscourse: "3",
            siblingsoccuptaion: "2");
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response))));
        print(
            'nameeeeeeeeeeeeeee -----------------------------${response.data!.familyInfo}');
        // print('gender -----------------------------${response.data!.gender}');

        // print('dob -----------------------------${response.data!.dob}');

        // print('address -----------------------------${response.data!.address}');
        // print(
        //     'phone nooooooooo -----------------------------${response.data!.phone}');

        // print(
        //     'emailllllllllllllllll -----------------------------${response.data!.email}');

        // print('bank  name -----------------------------${response.data!.bank}');

        // print(
        //     'bank account name -----------------------------${response.data!.bank!.bankAccName}');

        // print(
        //     'bank account number -----------------------------${response.data!.bank!.bankAccNo}');

        // print(
        //     'ifsc -----------------------------${response.data!.bank!.bankIfsc}');
      } catch (e) {
        emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(FamilyInfoState.initial());
    });
  }
}
