import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/academic_data/academic_data.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/core/service/academic_service.dart';

part 'academic_event.dart';
part 'academic_state.dart';
part 'academic_bloc.freezed.dart';

class AcademicBloc extends Bloc<AcademicEvent, AcademicState> {
  final academicService = AcademicService();
  AcademicBloc() : super(AcademicState.initial()) {
    on<postAcademicInfo>((event, emit) async {
      try {
        final response = await academicService.academicInfo();
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            academicData: response,
            successorFailure: optionOf(right(response))));
        print('from bloc file sucess ${state.academicData.data!.academics!.name}');
      } catch (e) {
        print('from bloc file errorr');
        emit(state.copyWith(
            isLoading: false,
            isError: true,
            successorFailure: optionOf(
                left(MainFailure.clientFailure(message: e.toString())))));
      }
      await Future.delayed(Duration.zero);
      emit(AcademicState.initial());
    });
  }
}
