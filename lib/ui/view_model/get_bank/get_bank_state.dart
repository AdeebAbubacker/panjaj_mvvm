part of 'get_bank_bloc.dart';

@freezed
class GetBankState with _$GetBankState {
  factory GetBankState.initial() {
    return GetBankState(
      isLoading: false,
      isError: false,
      bank: Bank(),
      successorFailure: const None(),
    );
  }
  const factory GetBankState({
    required bool isLoading,
    required bool isError,
    required Bank bank,
    required Option<Either<MainFailure, Bank>> successorFailure,
  }) = _GetBankState;
}

 