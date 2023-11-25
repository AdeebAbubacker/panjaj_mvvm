import 'package:flutter/material.dart';
import 'package:panakj_mvvm/core/constant/constants.dart';

class CheckBoxHome extends StatefulWidget {
  const CheckBoxHome({super.key});

  @override
  State<CheckBoxHome> createState() => _CheckBoxHomeState();
}

class _CheckBoxHomeState extends State<CheckBoxHome> {
  bool ownHouse = false;
  bool rentalHouse = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: ownHouse,
            onChanged: (value) {
              setState(() {
                ownHouse = true;
                rentalHouse = false;
              });
            }),
        const Text('Own House', style: checkboxOptionStyle),
        Spacer(),
        Checkbox(
            value: rentalHouse,
            onChanged: (value) {
              setState(() {
                rentalHouse = true;
                ownHouse = false;
              });
            }),
        const Text('Rental House', style: checkboxOptionStyle),
        Spacer(),
      ],
    );
  }
}
