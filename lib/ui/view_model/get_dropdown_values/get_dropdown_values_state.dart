part of 'get_dropdown_values_bloc.dart';

@freezed
class GetDropdownValuesState with _$GetDropdownValuesState {
  factory GetDropdownValuesState.initial() {
    return GetDropdownValuesState(
      isLoading: false,
      isError: false,
      dropDownValue: DropDownValues(),
      successorFailure: const None(),
    );
  }
  const factory GetDropdownValuesState({
    required bool isLoading,
    required bool isError,
    required DropDownValues dropDownValue,
    required Option<Either<MainFailure, DropDownValues>> successorFailure,
  }) = _GetDropdownValuesState;
}








// class GetBankState with _$GetBankState {
//   factory GetBankState.initial() {
//     return GetBankState(
//       isLoading: false,
//       isError: false,
//       bank: Bank(),
//       successorFailure: const None(),
//     );
//   }
//   const factory GetBankState({
//     required bool isLoading,
//     required bool isError,
//     required Bank bank,
//     required Option<Either<MainFailure, Bank>> successorFailure,
//   }) = _GetBankState;
// }