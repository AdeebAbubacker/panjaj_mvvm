import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/course_adapter/course_adapter.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/course_bottomsheet.dart';
//import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/course_bottomsheet.dart';

import 'package:panakj_app/ui/screens/student/widgets/horizontalRadioBtn.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_bottomSheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/family/family_bloc.dart';

class SiblingsCard extends StatefulWidget {
  final Widget siblings;
  bool mybool;
  TextEditingController nameController = TextEditingController();
  FocusNode siblingnamefocusNode;

  final width;
  SiblingsCard({
    super.key,
    this.width,
    required this.mybool,
    required this.siblingnamefocusNode,
    this.siblings = const Text(''),
  });

  @override
  State<SiblingsCard> createState() => _SiblingsCardState();
}

class _SiblingsCardState extends State<SiblingsCard> {
  List<Widget> siblingCards = [];
  late Box<CourseDB> courseBox;
  List<String> coursename = [];

  Future<void> setupCourseBox() async {
    courseBox = await Hive.openBox<CourseDB>('courseBox');

    if (!courseBox.isOpen) {
      print('CourseBox is not open');
      return;
    }

    List<int> keys = courseBox.keys.cast<int>().toList();

    print('All keys in courseBox: $keys');

    if (keys.isEmpty) {
      print('No couurses found in course box');
      return;
    }

    // Extract names from BankDB objects
    coursename = keys.map((key) {
      CourseDB bank = courseBox.get(key)!;
      return bank.name;
    }).toList();

    print('Course names: $coursename');

    // Ensure that the widget is rebuilt after the bankNames are populated
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    setupCourseBox();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<FamilyBloc, FamilyState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 12),
                child: Text('Brother / Sister', style: kfamiltTitleTextColor),
              ),
              LabelInputText(
                label: 'Name',
                StringInput: widget.nameController,
                focusNode: widget.siblingnamefocusNode,
              ),
              horizontalRadioBtn(
                steps: [
                  Content(choiceLabel: 'Male'),
                  Content(choiceLabel: 'Female'),
                ],
                title: 'Gender',
              ),
              InputLabel(mytext: 'Qualification'),
              labelBottomSheet(
                bottomSheetheight: 0.74,
                title: 'Qualification',
                hintText: 'Search For Occupation / Job',
                listofData: const [
                  'No Formal Education',
                  'Below SSLC',
                  'SSLC',
                  'Plus Two',
                  'Undergraduate',
                  'Postgraduate',
                  'M.Phil.',
                  'Doctorate (Ph.D.)'
                ],
              ),
              const HeightSpacer(),
              InputLabel(mytext: 'Course of Study'),
              coursebottomSheet(
                title: 'Course of Study',
              ),
              const HeightSpacer(),
              InputLabel(mytext: 'Occupation / Job'),
              labelBottomSheet(
                  title: 'Occupation Details',
                  hintText: 'Search For Occupation / Job'),
              const HeightSpacer(height: 14),
              Column(
                children: state.siblingCards.toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<FamilyBloc>().add(AddMoreSiblings());
                    },
                    child: const Text('Add more'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
