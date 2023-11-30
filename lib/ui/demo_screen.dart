// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:panakj_app/ui/view_model/courses/courses_bloc.dart';

// class DemoScreen extends StatelessWidget {
//   DemoScreen({super.key});
//   TextEditingController coursecontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: BlocBuilder<CoursesBloc, CoursesState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 TextField(
//                   controller: coursecontroller,
//                   onChanged: (value) {
//                     BlocProvider.of<CoursesBloc>(context)
//                         .add(GetCourses(movieQuery: coursecontroller.text));
//                   },
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
