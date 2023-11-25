import 'package:flutter/material.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/input_label.dart';

class LabelName extends StatefulWidget {
  final int maxlines;
  final double padding;
  final String labelText;
  final Function(String)? onChanged;

  const LabelName({
    this.maxlines = 1,
    Key? key,
    required this.labelText,
    this.padding = 5,
    this.onChanged,
  }) : super(key: key);

  @override
  _LabelNameState createState() => _LabelNameState();
}

class _LabelNameState extends State<LabelName> {
  final _controller = TextEditingController();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text);
      }
      setState(() {
        _isValid = isFieldEmpty(_controller.text);
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
          width: deviceWidth * 0.95,
          height: 50, // Set a fixed height here
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(255, 136, 133, 133),
              width: 1.0,
            ),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: TextFormField(
            controller: _controller,
            maxLines: widget.maxlines,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 6, left: 14),
              errorText: _isValid ? null : 'name is mandatory',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // bool isEmailValid(String email) {
  //   final emailRegExp =
  //       RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$');
  //   return emailRegExp.hasMatch(email);
  // }
  bool isFieldEmpty(String field) {
    if (field.isEmpty) {
      return false;
    }
    return field.isNotEmpty;
  }
}
