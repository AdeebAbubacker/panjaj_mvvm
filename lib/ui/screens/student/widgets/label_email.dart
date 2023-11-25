import 'package:flutter/material.dart';
import 'package:panakj_mvvm/core/constant/constants.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/input_label.dart';

class LabelEmail extends StatefulWidget {
  final int maxlines;
  final double padding;
  final String labelText;
  TextEditingController emailController = TextEditingController();
  final Function(String)? onChanged;

  LabelEmail({
    this.maxlines = 1,
    Key? key,
    required this.labelText,
    this.padding = 5,
    this.onChanged,
    required this.emailController,
  }) : super(key: key);

  @override
  _LabelEmailState createState() => _LabelEmailState();
}

class _LabelEmailState extends State<LabelEmail> {
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    widget.emailController .addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(widget.emailController .text);
      }
      setState(() {
        _isValid = isEmailValid(widget.emailController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputLabel(mytext: widget.labelText),
        Container(
          width: deviceWidth,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(255, 136, 133, 133),
              width: 1.0,
            ),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: TextFormField(
            style: kCardContentStyle,
            controller: widget.emailController,
            maxLines: widget.maxlines,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 6, left: 14),
              // hintText: 'Enter your email',
              errorText: _isValid ? null : 'Invalid email format',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  bool isEmailValid(String email) {
    final emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$');
    return emailRegExp.hasMatch(email);
  }
}
