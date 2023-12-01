import 'package:flutter/material.dart';
import 'package:panakj_app/ui/screens/student/screens/home/screens/home_layout.dart';
import 'package:panakj_app/ui/screens/student/screens/home/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  FocusNode landfocusNode = FocusNode();
   HomeScreen({super.key,required this.landfocusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeLayout(
          HomeLayoutheight: 670,
          title: 'Residential Details',
          homeDetailsCard: HomeCard(mybool: false,landfocusNode:landfocusNode),
        ),
      ],
    );
  }
}
