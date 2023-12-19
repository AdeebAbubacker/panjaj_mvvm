part of 'family_info_bloc.dart';

@freezed
class FamilyInfoEvent with _$FamilyInfoEvent {
  const factory FamilyInfoEvent.started() = _Started;
      const factory FamilyInfoEvent.postFamilyInfo({
  required final String name,
  }) = PostFamilyInfo;
}
