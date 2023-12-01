import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/achievments_layout.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/achievments_card.dart';
import 'package:panakj_app/ui/view_model/add_achievment/add_achievment_bloc.dart';

class AchievmentsScreen extends StatelessWidget {
  FocusNode focusNode = FocusNode();
   AchievmentsScreen({super.key,required this.focusNode,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAchievmentBloc, AddAchievmentState>(
      builder: (context, state) {
        return Column(
          children: [
            Achievmentslayout(
              achievmentDetailsCard: AchievmentsCard(mybool: false,focusNode: focusNode),
              title: 'Achievments',
              Achievmentslayoutheight: 500 +
                  (state.numberofachievment > 0
                      ? (state.numberofachievment) * 414
                      : 0),
            ),
          ],
        );
      },
    );
  }
}
