import 'package:flutter/material.dart';
import 'package:panakj_mvvm/package/core/constants.dart';

class StepperBtn extends StatelessWidget {
  final String nextorprev;
  const StepperBtn({super.key,this.nextorprev = 'Next'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 112, 42, 205),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child:  Center(
        child: Text(
          nextorprev,
          style: myButtontxtColor,
        ),
      ),
    );
  }
}
