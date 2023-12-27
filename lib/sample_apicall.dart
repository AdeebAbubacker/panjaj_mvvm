// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:panakj_app/ui/view_model/familyInfo/family_info_bloc.dart';

// class SampleApiCall extends StatelessWidget {
//   const SampleApiCall({super.key});

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       BlocProvider.of<FamilyInfoBloc>(context).add(const PostFamilyInfo(
//           name: "name",
//           relation: "relation",
//           phone: "phone",
//           email: "email",
//           highest_qualification: "highest_qualification",
//           occupation: "occupation",
//           income: "income",
//           disabled: "disabled",
//           siblingsname: "siblingsname",
//           siblingsgender: "siblingsgender",
//           siblingqualification: "siblingqualification",
//           siblingscourse: "siblingscourse",
//           siblingoccupation: "siblingoccupation"));
//     });
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {}, child: const Text('call family data'))
//         ],
//       )),
//     );
//   }
// }
