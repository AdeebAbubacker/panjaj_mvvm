part of 'family_info_bloc.dart';

@freezed
class FamilyInfoState with _$FamilyInfoState {
  
    factory FamilyInfoState.initial() {
    return FamilyInfoState(
      isLoading: false,
      isError: false,
      familyInfo: FamilyInfo(),
      successorFailure: const None(),
    );
  }

  const factory FamilyInfoState({
    required bool isLoading,
    required bool isError,
    required FamilyInfo familyInfo,
    required Option<Either<MainFailure, FamilyInfo>> successorFailure,
  }) = _FamilyInfoState;
}
