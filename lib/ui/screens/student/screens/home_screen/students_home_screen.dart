import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/course_adapter/course_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/boxes/bank_box.dart';
import 'package:panakj_app/core/db/boxes/course_box.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/package/widget/myAppbar.dart';
import 'package:panakj_app/ui/screens/auth/login_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/Students_application_form/students_application_form.dart';
import 'package:panakj_app/ui/view_model/get_dropdown_values/get_dropdown_values_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsHomeScreen extends StatefulWidget {
  const StudentsHomeScreen({super.key});

  @override
  State<StudentsHomeScreen> createState() => _StudentsHomeScreenState();
}

class _StudentsHomeScreenState extends State<StudentsHomeScreen> {
  var bank;

  var course;

  var schools;

  Map<int?, String?>? bankData;

  Map<int?, String?>? courseData;

  Map<int?, String?>? schoolData;

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetDropdownValuesBloc>(context)
          .add(const GetDropDownValues());
    });
    return BlocConsumer<GetDropdownValuesBloc, GetDropdownValuesState>(
      listener: (context, state) {
        if (state.isError) {}
        if (state.isLoading) {
        } else {
          state.successorFailure.fold(
            () => () {},
            (either) => either.fold(
                (failure) => {print('Failure')},
                (success) => {
                      bankData = Map.fromIterables(
                        success.data!.banks!.toList().map((e) => e.id).toList(),
                        success.data!.banks!
                            .toList()
                            .map((e) => e.name)
                            .toList(),
                      ),
                      courseData = Map.fromIterables(
                          success.data!.courses!.toList().map((e) => e.id),
                          success.data!.courses!.toList().map((e) => e.name)),
                      schoolData = Map.fromIterables(
                          success.data!.schools!.toList().map((e) => e.id),
                          success.data!.schools!.toList().map((e) => e.name)),
                      bankBox = Hive.box<BankDB>('bankBox'),
                      courseBox = Hive.box<CourseDB>('courseBox'),
                      schoolBox = Hive.box<SchoolDB>('schoolBox'),
                      //   bankBox.clear(),
                      bankData!.forEach((id, name) {
                        bankBox.put(
                            id as int,
                            BankDB(
                                id: id,
                                name: name as String,
                                deletedAt: 'null'));
                      }),
                      courseData!.forEach((id, name) {
                        courseBox.put(
                            id as int,
                            CourseDB(
                              id: id,
                              name: name as String,
                            ));
                      }),
                      schoolData!.forEach((id, name) {
                        schoolBox.put(
                            id as int,
                            SchoolDB(
                              id: id,
                              name: name as String,
                            ));
                      }),

                      for (var i = 0; i < bankBox.length; i++)
                        {
                          bank = bankBox.getAt(i),
                          print('sss'),
                        },

                      for (var i = 0; i < courseBox.length; i++)
                        {
                          course = courseBox.getAt(i),
                          print('sss'),
                        },
                      for (var i = 0; i < schoolBox.length; i++)
                        {
                          schools = schoolBox.getAt(i),
                          print('sss'),
                        },
                    }),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 227, 226, 226),
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(67.0),
            child: myAppBar(leadingIcon: Icon(Icons.person)),
          ),
          drawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 219, 219, 220),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const CircleAvatar(
                    radius: 40, backgroundImage: AssetImage('assets/jk.jpg')),
                TextButton(
                  onPressed: () {
                    SharedPreferences.getInstance()
                        .then((prefs) => prefs.clear());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                        (route) => false);
                  },
                  child: const Text("Logout"),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(183, 213, 218, 220),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 227, 226, 226)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            ' Apply For Scholorship',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 390,
                            height: 1,
                            color: Colors.black54,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Seize the opportunity to shape your academic destiny by submitting your application for the Pankaj Trust Scholarship today – a gateway to a future brimming with possibilities!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260, top: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const StudentsApplicationForm();
                                  },
                                ),
                              );
                            },
                            child: const Text('Apply Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 395,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(183, 213, 218, 220),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 227, 226, 226)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            ' Application Status',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
