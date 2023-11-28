import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/checkbox_home.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/checkbox_triplets.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/land_answer_text.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/get_dropdown_values/get_dropdown_values_bloc.dart';

class HomeCard extends StatefulWidget {
  final Widget siblings;
  bool mybool;

  final width;
  HomeCard({
    super.key,
    this.width,
    required this.mybool,
    this.siblings = const Text(''),
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '* nb: Please provide your residential details genuinely',
            style: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          ),
          HeightSpacer(),
          HeightSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'Which category best describes your current residence ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          CheckBoxHome(),
          HeightSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'What type of roofing material does your residence have ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          CheckBoxTriplet(
            option1: 'sheet',
            option2: 'concrete',
            option3: 'Tilled',
          ),
          HeightSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'What is the source of drinking water at your residence ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          CheckBoxTriplet(
              option1: 'Pipe water',
              option2: 'Well Water',
              option3: 'Other Source'),
          HeightSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4. ',
                style: homeContentStyle,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    textAlign: TextAlign.justify,
                    'How many extend of land do you own ?',
                    style: homeContentStyle),
              ),
            ],
          ),
          LandAnswerTextField()
          // BlocBuilder<GetDropdownValuesBloc, GetDropdownValuesState>(
          //   builder: (context, state) {
          //     return Column(children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           context
          //               .read<GetDropdownValuesBloc>()
          //               .add(const GetDropDownValues());
          //         },
          //         child: const Text('Call dropdown list'),
          //       ),
          //       if (state.isError)
          //         const Column(
          //           children: [
          //             // Add error-related widgets here
          //             Text('Error occurred!'),
          //           ],
          //         )
          //       else
          //         // Text(
          //         //     '${state.dropDownValue.data!.datadropdown!.courses!.data!.toList().map((e) => e.name.toString())}')
          //     ]);
          //   },
          // )
        ],
      ),
    );
  }
}
