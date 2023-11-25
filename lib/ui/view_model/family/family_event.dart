part of 'family_bloc.dart';

@immutable
class FamilyEvent {}

class ForSiblings extends FamilyEvent{
   bool siblings;
 
  ForSiblings({this.siblings = false,});
}

class FornoSiblings extends FamilyEvent{
   bool nosiblings;
  FornoSiblings({this.nosiblings = false,});
}

class AddMoreSiblings extends FamilyEvent {}
class DeleteSibling extends FamilyEvent {
  final int siblingIndex ;

  DeleteSibling({required this.siblingIndex});
}