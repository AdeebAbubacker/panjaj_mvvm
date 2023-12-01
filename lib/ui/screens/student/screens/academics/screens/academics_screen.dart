import 'package:flutter/material.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/academics_layout.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/academics_card.dart';

class AcademicsScreen extends StatelessWidget {
  FocusNode examRegfocusnode;
  FocusNode sslcfocusnode;
  FocusNode plusonefocusnode;
  FocusNode plustwofocusnode;
   AcademicsScreen({
    super.key,
    required this.examRegfocusnode,
    required this.sslcfocusnode,
    required this.plusonefocusnode,
    required this.plustwofocusnode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AcademicsLayout(
          AcademicsLayoutheight: 470,
          title: 'Academic Details',
          academicsDetailsCard: AcademicsCard(
            mybool: false,
            examRegfocusnode: examRegfocusnode,
            sslcfocusnode: sslcfocusnode,
            plusonefocusnode: plusonefocusnode,
            plustwofocusnode: plustwofocusnode,
          ),
        ),
      ],
    );
  }
}
