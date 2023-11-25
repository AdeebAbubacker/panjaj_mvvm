import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/academics/screens/achievments_layout.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/academics/widgets/achievments_card.dart';
import 'package:panakj_mvvm/ui/view_model/add_achievment/add_achievment_bloc.dart';

class AchievmentsScreen extends StatelessWidget {
  const AchievmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAchievmentBloc, AddAchievmentState>(
      builder: (context, state) {
        return Column(
          children: [
            Achievmentslayout(
              achievmentDetailsCard: AchievmentsCard(mybool: false),
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

