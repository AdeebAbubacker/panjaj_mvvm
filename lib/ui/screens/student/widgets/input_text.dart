import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panakj_app/core/constant/constants.dart';

class InpuText extends StatefulWidget {
  final int maxlines;
  TextEditingController StringInput = TextEditingController();
  InpuText({
    this.maxlines = 1,
    required this.StringInput,
    Key? key,
  }) : super(key: key);

  @override
  State<InpuText> createState() => _InpuTextState();
}

class _InpuTextState extends State<InpuText> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: kpadding14(
            child: TextField(
                controller: widget.StringInput,
                maxLines: widget.maxlines,
                decoration: const InputDecoration(border: InputBorder.none),
                style: kFormContentStyle),
          ),
        ),
      ],
    );
  }
}
