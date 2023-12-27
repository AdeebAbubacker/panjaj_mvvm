part of 'academic_bloc.dart';

@freezed
class AcademicEvent with _$AcademicEvent {
  const factory AcademicEvent.started() = _Started;
      const factory AcademicEvent.postAcademicInfo({
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
  }) = postAcademicInfo;
}
