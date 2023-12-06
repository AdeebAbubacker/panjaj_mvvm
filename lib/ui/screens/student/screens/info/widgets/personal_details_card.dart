// -------------------- 1st Card ------------------------------------------

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:panakj_app/ui/screens/student/widgets/do_you_have_bankaccount.dart';
import 'package:panakj_app/ui/screens/student/widgets/enterDOB.dart';
import 'package:panakj_app/ui/screens/student/widgets/horizontal_radiobtn.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_email.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/labul_NumericalText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

class PersonalDetailsCard extends StatefulWidget {
  bool mybool;
  final TextEditingController nameController;
  FocusNode infonamefocusNode ;
   FocusNode addressfocusNode;
   FocusNode numericalfocusnode;
   FocusNode emailfocusnode;
  final TextEditingController addressController;
  final TextEditingController phoneNoController;
  final TextEditingController emailController;
  final width;
  PersonalDetailsCard({
    super.key,
    this.width,
    required this.mybool,
    required this.numericalfocusnode,
    required this.nameController,
    required this.infonamefocusNode,
    required this.addressfocusNode,
    required this.emailfocusnode,
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
          LabelInputText(
            label: 'Name',
            StringInput: widget.nameController,
            focusNode: widget.infonamefocusNode,
          ),
          const HeightSpacer(height: 14),
          HorizontalRadioBtn(
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
            focusNode: widget.addressfocusNode,
          ),
          const HeightSpacer(height: 14),
          LabelNumericalText(
            numericalfocusnode: widget.numericalfocusnode,
              mytext: 'Phone no', numController: widget.phoneNoController),
          const HeightSpacer(height: 14),
          LabelEmail(
            labelText: 'email',           
            emailController: widget.emailController,
            emailfocusnode: widget.emailfocusnode,
          ),
          const DoYouHaveBankAcc(),
        ],
      ),
    );
  }
}
