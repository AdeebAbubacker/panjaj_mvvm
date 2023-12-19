import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/model/family_data/family_data.dart';

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
            name: "Adeeb",
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
         print('from bloc file sucess');

print('Guardian name: ${response.data!.familyInfo!.guardians![1].name}');
print('Guardian income:  ${response.data!.familyInfo!.guardians![1].income}');
print('Guardian lifeStatus: ${response.data!.familyInfo!.guardians![1].lifeStatus}');
print('Guardian income:  ${response.data!.familyInfo!.guardians![1].income}');
print('Guardian occupation:  ${response.data!.familyInfo!.guardians![1].ocupation}');
print('Guardian relation:  ${response.data!.familyInfo!.guardians![1].relation}');
print('Guardian bedridden:  ${response.data!.familyInfo!.guardians![1].bedridden}');
print('Guardian name:  ${response.data!.familyInfo!.guardians![1].name}');




      } catch (e) {
        print('from bloc file errorr');
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
