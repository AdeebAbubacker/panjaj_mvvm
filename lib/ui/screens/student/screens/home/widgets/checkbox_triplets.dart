import 'package:flutter/material.dart';
import 'package:panakj_app/core/constant/constants.dart';

class CheckBoxTriplet extends StatefulWidget {
  final String option1;
  final String option2;
  final String option3;
  const CheckBoxTriplet({
    super.key,
    required this.option1,
    required this.option2,
    required this.option3,
  });

  @override
  State<CheckBoxTriplet> createState() => _CheckBoxTripletState();
}

class _CheckBoxTripletState extends State<CheckBoxTriplet> {
  bool option1bool = false;
  bool option2bool = false;
  bool option3bool = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                value: option1bool,
                onChanged: (value) {
                  setState(() {
                    option1bool = true;
                    option2bool = false;
                    option3bool = false;
                  });
                }),
            Text(widget.option1, style: checkboxOptionStyle),
            Spacer(),
            Checkbox(
                value: option2bool,
                onChanged: (value) {
                  setState(() {
                    option1bool = false;
                    option2bool = true;
                    option3bool = false;
                  });
                }),
            Text(widget.option2, style: checkboxOptionStyle),
            Spacer(),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: option3bool,
                onChanged: (value) {
                  setState(() {
                    option1bool = false;
                    option2bool = false;
                    option3bool = true;
                  });
                }),
            Text(widget.option3, style: checkboxOptionStyle),
          ],
        )
      ],
    );
  }
}
