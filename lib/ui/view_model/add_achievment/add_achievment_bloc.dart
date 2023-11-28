import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/drop_down_menu.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/file_picker.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

part 'add_achievment_event.dart';
part 'add_achievment_state.dart';

class AddAchievmentBloc extends Bloc<AddAchievmentEvent, AddAchievmentState> {
  AddAchievmentBloc()
      : super(AddAchievmentState(
            achievmentcards: List.empty(), numberofachievment: 0)) {
    on<AddMoreAchievments>((event, emit) {
      List<Widget> updatedSiblings = List.from(state.achievmentcards);
      int newIndex = updatedSiblings.length + 1;
      final numberofSiblings = newIndex;
      updatedSiblings.add(_buildachievmentsCard(newIndex, add));
      emit(AddAchievmentState(
          achievmentcards: updatedSiblings,
          numberofachievment: numberofSiblings));
    });

    on<DeleteSibling>((event, emit) {
      List<Widget> updatedSiblings = List.from(state.achievmentcards);

      // Ensure the index is within the valid range
      if (event.achievmentIndex >= 0 &&
          event.achievmentIndex < updatedSiblings.length) {
        updatedSiblings.removeAt(event.achievmentIndex);

        // Update the numberOfSiblings based on the updated list length
        final numberofSiblings = updatedSiblings.length;

        emit(AddAchievmentState(
          achievmentcards: updatedSiblings,
          numberofachievment: numberofSiblings,
        ));
      }
    });
  }
}

Widget _buildachievmentsCard(
    int achievmentIndex, void Function(AddAchievmentEvent) add) {
  TextEditingController achievmentController = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 1,
        width: 380,
        color: const Color.fromARGB(255, 187, 189, 190),
      ),
      const HeightSpacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              final newachievmentIndex = achievmentIndex - 1;
              add(DeleteSibling(achievmentIndex: newachievmentIndex));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete_outline_rounded),
                Text('Remove'),
              ],
            ),
          ),
        ],
      ),
      LabelInputText(
        label: 'Achievment Details',
        maxlines: 3,
        StringInput: achievmentController,
      ),
      const HeightSpacer(),
      InputLabel(mytext: 'Category'),
      const MyDropdown(),
      const HeightSpacer(),
      InputLabel(mytext: 'Upload File'),
      FilePickerScreen(),
      const HeightSpacer(),
    ],
  );
}
