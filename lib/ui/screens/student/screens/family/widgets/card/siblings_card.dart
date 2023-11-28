import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/constant/constants.dart';
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

  final width;
  SiblingsCard({
    super.key,
    this.width,
    required this.mybool,
    this.siblings = const Text(''),
  });

  @override
  State<SiblingsCard> createState() => _SiblingsCardState();
}

class _SiblingsCardState extends State<SiblingsCard> {
  List<Widget> siblingCards = [];

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
              LabelInputText(label: 'Name',StringInput:widget.nameController),
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
              labelBottomSheet(
                  listofData: const [
                    'Nil',
                    'AMIE',
                    'B Voc Food',
                    'B.A',
                    'B.A. Accountancy',
                    'B.A. Applied Psychology',
                    'B.A. Economics',
                    'B.A. English',
                    'B.A. English Literature',
                    'B.A. Hindi',
                    'B.A. History',
                    'B.A. Malayalam',
                    'B.A. Music',
                    'B.A. Sanskrit',
                    'B.A. Sociology',
                    'B.Com',
                    'B.Com Computer Application',
                    'B.Com Finance and Taxation',
                    'B.Sc',
                    'B.Sc',
                    'B.Sc Agriculture',
                    'B.Sc Agriculture',
                    'B.Sc Botany',
                    'B.Sc Chemistry',
                    'B.Sc Computer',
                    'B.Sc Electronics',
                    'B.Sc Hotel Management',
                    'B.Sc Mathematics',
                    'B.Sc Nursing',
                    'B.Sc Nursing',
                    'B.Sc Nursing',
                    'B.Sc Physics',
                    'B.Sc Taxation',
                    'B.Sc Zoology',
                    'B.Tech',
                    'B.Tech Computer Science',
                    'B.Tech EEE',
                    'B.Tech Electronics & Communication',
                    'B.Tech IT',
                    'B.Tech Mechanical Engineering',
                    'B.Tech Space Science',
                    'B.Voc Industrial Instrumentation & Automation',
                    'B.Voc Tourism & Hospitality Management',
                    'BBA',
                    'BBA LLB',
                    'BBM',
                    'BCA',
                    'BE Agriculture',
                    'BTTM',
                    'Comp. Hardware',
                    'D. Pharm',
                    'DED',
                    'Diploma',
                    'Diploma Eng.',
                    'Diploma in C.A.',
                    'Diploma in Chemical Engineering',
                    'Diploma in Civil Engineering',
                    'Diploma in Computer',
                    'Diploma in Computer Engineering',
                    'Diploma in Computer Science',
                    'Diploma in Electronics',
                    'Diploma in Electronics',
                    'Diploma in Mechanical Engineering',
                    'Diploma in X-Ray & Radiology',
                    'General Nursing',
                    'GNM',
                    'Hospital Management',
                    'LLB',
                    'M.Sc Electrical',
                    'Nursing',
                    'Nursing',
                    'Polytechnic - Electronic & Communications',
                    'Polytechnic Welding',
                    'TTE'
                  ],
                  title: 'Course of Study',
                  hintText: 'Search For Occupation / Job'),
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
