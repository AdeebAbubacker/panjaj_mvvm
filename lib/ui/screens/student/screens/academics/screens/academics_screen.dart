import 'package:flutter/material.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/academics/screens/academics_layout.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/academics/widgets/academics_card.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AcademicsLayout(
          AcademicsLayoutheight: 470,
          title: 'Academic Details',
          academicsDetailsCard: AcademicsCard(
            mybool: false,
          ),
        ),
      ],
    );
  }
}
