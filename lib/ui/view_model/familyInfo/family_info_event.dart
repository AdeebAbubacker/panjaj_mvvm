part of 'family_info_bloc.dart';

@freezed
class FamilyInfoEvent with _$FamilyInfoEvent {
  const factory FamilyInfoEvent.started() = _Started;
      const factory FamilyInfoEvent.postFamilyInfo({
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
  }) = PostFamilyInfo;
}
