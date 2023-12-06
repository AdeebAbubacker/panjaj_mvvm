part of 'check_box_bloc.dart';

@immutable
class CheckBoxEvent {
  final bool alive;
  final bool bedridden;
  const CheckBoxEvent({this.alive = false, this.bedridden = false});
}
