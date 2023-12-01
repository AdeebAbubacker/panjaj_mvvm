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
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/lineDivider.dart';
import 'package:panakj_app/ui/view_model/get_dropdown_values/get_dropdown_values_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsHomeScreen extends StatelessWidget {
  StudentsHomeScreen({super.key});

  var bank;
  var course;
  var schools;
  Map<int?, String?>? bankData;
  Map<int?, String?>? courseData;
  Map<int?, String?>? schoolData;
  @override
  Widget build(BuildContext context) {
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
                (failure) => {},
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
                          print('Bank with id ${bank?.id}: ${bank?.name}'),
                        },
                      for (var i = 0; i < courseBox.length; i++)
                        {
                          course = courseBox.getAt(i),
                          print('Bank with id ${course?.id}: ${course?.name}'),
                        },
                      for (var i = 0; i < schoolBox.length; i++)
                        {
                          schools = schoolBox.getAt(i),
                          print(
                              'Schools with id ${schools?.id}: ${schools?.name}'),
                        }
                    }),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return StudentsApplicationForm();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 213, 218, 220),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'Fill Application',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          LineDivider(),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Please fill your application form, for completing application',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
