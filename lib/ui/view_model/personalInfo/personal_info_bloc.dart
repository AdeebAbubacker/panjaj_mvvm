import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_mvvm/core/model/failure/mainfailure.dart';
import 'package:panakj_mvvm/core/model/personal_info/personal_info.dart';
import 'package:panakj_mvvm/core/service/personalinfo_service.dart';

part 'personal_info_event.dart';
part 'personal_info_state.dart';
part 'personal_info_bloc.freezed.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final personalinfoService = PersonalInfoService();
  PersonalInfoBloc() : super(PersonalInfoState.initial()) {
    on<PostPersonalInfo>((event, emit) async {
      try {
        final response = await personalinfoService.personalInfo(
          name: event.name,
          gender: event.gender,
          dob: event.dob,
          phone: event.phone,
          address: event.address,
          email: event.email,
          bankaccname: event.bankaccname,
          bankaccno: event.bankaccno,
          bankname: event.bankname,
          bankifsc: event.bankifsc,
        );
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response))));
        print(
            'nameeeeeeeeeeeeeee -----------------------------${response.data!.map((e) => e.name.toString())}');
        print(
            'gender -----------------------------${response.data!.map((e) => e.gender.toString())}');

        print(
            'dob -----------------------------${response.data!.map((e) => e.dob.toString())}');

        print(
            'address -----------------------------${response.data!.map((e) => e.address.toString())}');
        print(
            'phone nooooooooo -----------------------------${response.data!.map((e) => e.phone.toString())}');

        print(
            'emailllllllllllllllll -----------------------------${response.data!.map((e) => e.email.toString())}');

        print(
            'bank  name -----------------------------${response.data!.map((e) => e.bankName.toString())}');

        print(
            'bank account name -----------------------------${response.data!.map((e) => e.bankAccName.toString())}');

        print(
            'bank account number -----------------------------${response.data!.map((e) => e.bankAccNo.toString())}');

        print(
            'ifsc -----------------------------${response.data!.map((e) => e.bankIfsc.toString())}');
      } catch (e) {
        emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(PersonalInfoState.initial());
    });
  }
}
