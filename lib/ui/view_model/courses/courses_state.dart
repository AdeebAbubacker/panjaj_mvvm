part of 'courses_bloc.dart';

@freezed
class CoursesState with _$CoursesState {
   factory CoursesState.initial(){
      return CoursesState(
      isLoading: false,
      isError: false,
      course: Courses(),
      searchResultList: Datum(),
      
      successorFailure: const None(),
    );
   }
     const factory CoursesState({
    required bool isLoading,
    required bool isError,
    required Courses course,
    required Option<Either<MainFailure, Course>> successorFailure,
    required Datum  searchResultList,
  }) = _CoursesState;
}





