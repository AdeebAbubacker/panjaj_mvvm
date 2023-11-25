// when i put choice value 1, 2, 3 in list then automatically
// it should generate radio buttons

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_mvvm/core/constant/constants.dart';
import 'package:panakj_mvvm/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';

class horizontalRadioBtn extends StatelessWidget {
  String? title;
  int groupValue;
  final List<Content> steps;

  horizontalRadioBtn(
      {super.key,
      required this.title,
      this.groupValue = 0,
      required this.steps});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            title.toString(),
            style: kCardContentStyle,
          ),
        ),
        const Spacer(),
        Row(
          children: steps.asMap().entries.map(
            (entry) {
              final index = entry.key + 1;
              final content = entry.value;
              return Row(
                children: [
                  BlocBuilder<HorizontalRadioBtnBloc, HorizontalRadioBtnState>(
                    builder: (context, state) {
                      return Radio(
                        value: index,
                        groupValue: state.groupValue,
                        onChanged: (value) {
                          context
                              .read<HorizontalRadioBtnBloc>()
                              .add(SetGroupValueEvent(value as int));
                        },
                      );
                    },
                  ),
                  Text(
                    content.choiceLabel,
                    style: kCardContentStyle,
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

class Content {
  final String choiceLabel;

  Content({
    required this.choiceLabel,
  });
}
