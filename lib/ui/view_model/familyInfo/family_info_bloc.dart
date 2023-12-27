import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/db/boxes/family_status_box.dart';
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
          fathername: event.fathername,
          falive: event.falive,
          fdisabled: event.fdisabled,
          focupation: event.focupation,
          fincome: event.fincome,
          frelation: event.frelation,
          mothername: event.mothername,
          malive: event.malive,
          mdisabled: event.mdisabled,
          mocupation: event.mocupation,
          mincome: event.mincome,
          mrelation: event.mrelation,
          guardainame: event.guardianname,
          galive: event.galive,
          gdisabled: event.gdisabled,
          gocupation: event.gocupation,
          gincome: event.gincome,
          siblingname: event.siblingname1,
          siblinggender: event.sgender1,
          squalification: event.squalification1,
          scourse: event.scourse1,
          socupation: event.socupation1,
        );
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            successorFailure: optionOf(right(response))));
        print('from bloc file sucess');
        int familyStatusId = familystatusInfoBox.get('key')?.id ?? 1;

// Make sure familyStatusId is within the valid range

        int startIndex = (familyStatusId) * 3;

        // Check if the list is not null and has enough elements

        print('Guardian name father --------------: ${startIndex}'); // Ashwin

        print(
            'Guardian name mother --------------: ${startIndex + 1}'); // Ashwin
        print(
            'Guardian name guardian --------------: ${startIndex + 2}'); // Ashwin
        print(
            'father  name --------------: ${response.data!.guardians![startIndex].name}');
        print(
            'father  income --------------: ${response.data!.guardians![startIndex].income}');
        print(
            'father  alive --------------: ${response.data!.guardians![startIndex].alive}');
        print(
            'father  disabled --------------: ${response.data!.guardians![startIndex].disabled}');

        print(
            'mother  name --------------: ${response.data!.guardians![startIndex + 1].name}');
        print(
            'mother  income --------------: ${response.data!.guardians![startIndex + 1].income}');
        print(
            'mother  alive --------------: ${response.data!.guardians![startIndex + 1].alive}');
        print(
            'mother  disabled --------------: ${response.data!.guardians![startIndex + 1].disabled}');
        print(
            'guardian  name --------------: ${response.data!.guardians![startIndex + 2].name}');
        print(
            'guardian  income --------------: ${response.data!.guardians![startIndex + 2].income}');
        print(
            'guardian  alive --------------: ${response.data!.guardians![startIndex + 2].alive}');
        print(
            'guardian  disabled --------------: ${response.data!.guardians![startIndex + 2].disabled}');
        print(
            'sibling  name --------------: ${response.data!.siblings![0].name}');
        print(
            'sibling  gender --------------: ${response.data!.siblings![0].createdAt}');
        print(
            'sibling  name --------------: ${response.data!.siblings![0].name}');

        print(
            'sibling  qualification --------------: ${response.data!.siblings![0].highestQualification}');

        print(
            'sibling  course --------------: ${response.data!.siblings![0].course}');
        print(
            'sibling  occupation --------------: ${response.data!.siblings![0].occupation}');
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
