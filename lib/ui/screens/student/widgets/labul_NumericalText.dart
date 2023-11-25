import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panakj_mvvm/core/constant/constants.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/input_label.dart';

// ignore: must_be_immutable
class LabelNumericalText extends StatelessWidget {
  final int maxlines;
  String mytext;
  final double padding;
   TextEditingController numController = TextEditingController();
  LabelNumericalText(
      {this.maxlines = 1, super.key, required this.mytext, this.padding = 5,required this.numController});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputLabel(mytext: mytext),
        Container(
          width: deviceWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 136, 133, 133),
                width: 1.0,
              ),
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: kpadding14(
            child: TextField(
             controller: numController, 
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
