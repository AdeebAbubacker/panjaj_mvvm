import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/exam_reg.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/marks_details.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/school_bottomsheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_bottomSheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/course_bottomsheet.dart';

class AcademicsCard extends StatefulWidget {
  final Widget siblings;
  FocusNode examRegfocusnode;
  FocusNode sslcfocusnode;
  FocusNode plusonefocusnode;
  FocusNode plustwofocusnode;
  bool mybool;

  final width;
  AcademicsCard({
    super.key,
    this.width,
    required this.examRegfocusnode,
    required this.mybool,
    required this.sslcfocusnode,
    required this.plusonefocusnode,
    required this.plustwofocusnode,
    this.siblings = const Text(''),
  });

  @override
  State<AcademicsCard> createState() => _AcademicsCardState();
}

class _AcademicsCardState extends State<AcademicsCard> {
  late Box<SchoolDB> schoolBox;
  List<String> schoolNames = [];
  @override
  void initState() {
    super.initState();

    setupSchoolBox();
  }

  Future<void> setupSchoolBox() async {
    schoolBox = await Hive.openBox<SchoolDB>('schoolBox');

    if (!schoolBox.isOpen) {
      print('schoolBox is not open');
      return;
    }

    List<int> keys = schoolBox.keys.cast<int>().toList();

    print('All keys in schoolBox: $keys');

    if (keys.isEmpty) {
      print('No banks found in schoolBox');
      return;
    }

    // Extract names from BankDB objects
    schoolNames = keys.map((key) {
      SchoolDB school = schoolBox.get(key)!;
      return school.name;
    }).toList();

    print('Bank names: $schoolNames');

    // Ensure that the widget is rebuilt after the bankNames are populated
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputLabel(mytext: 'School Name'),
          schoolBottomSheet(title: 'School Name'),
          const HeightSpacer(),
          ExamReg(examRegfocusnode: widget.examRegfocusnode),
          const HeightSpacer(),
          Marksdetails(
            title: 'SSLC Marks',
            marksfocusnode: widget.sslcfocusnode,
          ),
          const HeightSpacer(),
          Marksdetails(
            title: 'Plus One Marks',
            marksfocusnode: widget.plusonefocusnode,
          ),
          const HeightSpacer(),
          Marksdetails(
            title: 'Plus Two Marks',
            marksfocusnode: widget.plustwofocusnode,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Preference for Higher Studies'),
          coursebottomSheet(
            title: 'Course of Study',
          ),
        ],
      ),
    );
  }
}
