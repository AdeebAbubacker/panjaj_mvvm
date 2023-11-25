// -------------------- 1st Card ------------------------------------------

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/do_you_have_bankaccount.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/enterDOB.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/horizontalRadioBtn.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/label_email.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/spacer_height.dart';

class PersonalDetailsCard extends StatefulWidget {
  bool mybool;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController phoneNoController;
  final TextEditingController emailController;
  final width;
  PersonalDetailsCard({
    super.key,
    this.width,
    required this.mybool,
    required this.nameController,
    required this.addressController,
    required this.phoneNoController,
    required this.emailController,
  });

  @override
  State<PersonalDetailsCard> createState() => _PersonalDetailsCardState();
}

class _PersonalDetailsCardState extends State<PersonalDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelInputText(label: 'Name', StringInput: widget.nameController),
          const HeightSpacer(height: 14),
          horizontalRadioBtn(
            steps: [
              Content(choiceLabel: 'Male'),
              Content(choiceLabel: 'Female'),
            ],
            title: 'Gender',
          ),
          const HeightSpacer(height: 14),
          const DOBPicker(),
          const HeightSpacer(height: 14),
          LabelInputText(
            label: 'Address',
            maxlines: 3,
            StringInput: widget.addressController,
          ),
          const HeightSpacer(height: 14),
          LabelNumericalText(
              mytext: 'Phone no', numController: widget.phoneNoController),
          const HeightSpacer(height: 14),
          LabelEmail(
            labelText: 'email',emailController: widget.emailController,
          ),
          const DoYouHaveBankAcc(),
        ],
      ),
    );
  }
}
