part of 'add_achievment_bloc.dart';

@immutable
class AddAchievmentEvent {}

class AddMoreAchievments extends AddAchievmentEvent {}


class DeleteSibling extends AddAchievmentEvent {
  final int achievmentIndex ;

  DeleteSibling({required this.achievmentIndex});
}