import 'package:flutter/material.dart';
import 'package:panakj_app/core/constant/constants.dart';

class CheckBoxData extends StatefulWidget {
  final double width;
  final String label;
  const CheckBoxData({super.key, required this.label, this.width = 20});

  @override
  CheckBoxDataState createState() => CheckBoxDataState();
}

class CheckBoxDataState extends State<CheckBoxData> {
  bool aliveOrDisabled = false;
  bool deadOrEnabled = false;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            widget.label,
            style: kCardContentStyle,
          ),
        ),
        const Spacer(),
        Checkbox(
            value: aliveOrDisabled,
            onChanged: (value) {
              setState(() {
                aliveOrDisabled = true;
                deadOrEnabled ? deadOrEnabled = false : '';
              });
            }),
        Text(
          'yes',
          style: kCardContentSmallStyle,
        ),
        Checkbox(
            value: deadOrEnabled,
            onChanged: (value) {
              setState(() {
                deadOrEnabled = true;
                deadOrEnabled ? aliveOrDisabled = false : '';
              });
            }),
        Text(
          'no',
          style: kCardContentSmallStyle,
        ),
      ],
    );
  }
}
