import 'package:flutter/material.dart';
import 'package:panakj_mvvm/package/widget/myAppbar.dart';
import 'package:panakj_mvvm/ui/screens/auth/login_screen.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/Students_application_form/students_application_form.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/family/widgets/local_widgets/lineDivider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsHomeScreen extends StatelessWidget {
  const StudentsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                SharedPreferences.getInstance().then((prefs) => prefs.clear());
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return StudentsApplicationForm();
                    },
                  ));
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 213, 218, 220),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                          style: TextStyle(fontSize: 14, color: Colors.black87),
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
  }
}
