import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/ui/view_model/acadmicdetails/academic_bloc.dart';

class PostAChievmentScreen extends StatelessWidget {
  const PostAChievmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AcademicBloc>(context).add(
                      AcademicEvent.postFamilyInfo(
                          name: "name",
                          relation: "relation",
                          phone: "phone",
                          email: "email",
                          highest_qualification: "highest_qualification",
                          occupation: "occupation",
                          income: "income",
                          alive: "alive",
                          disabled: "disabled",
                          siblingname: "siblingname",
                          siblinggender: "siblinggender",
                          siblingsqualification: "siblingsqualification",
                          siblingscourse: "siblingscourse",
                          siblingsoccuptaion: "siblingsoccuptaion"));
                },
                child: const Text('post achievment'))
          ],
        ),
      ),
    );
  }
}
