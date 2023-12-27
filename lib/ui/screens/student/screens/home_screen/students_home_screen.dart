import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/course_adapter/course_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/boxes/bank_box.dart';
import 'package:panakj_app/core/db/boxes/course_box.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/package/widget/myAppbar.dart';
import 'package:panakj_app/ui/screens/auth/login_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/Students_application_form/students_application_form.dart';
import 'package:panakj_app/ui/screens/student/screens/home_screen/gallery_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/home_screen/notification_screen.dart';
import 'package:panakj_app/ui/screens/student/widgets/myPadding.dart';
import 'package:panakj_app/ui/view_model/get_dropdown_values/get_dropdown_values_bloc.dart';
import 'package:panakj_app/ui/view_model/get_news/get_news_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsHomeScreen extends StatefulWidget {
  const StudentsHomeScreen({super.key});

  @override
  State<StudentsHomeScreen> createState() => _StudentsHomeScreenState();
}

class _StudentsHomeScreenState extends State<StudentsHomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        return Builder(builder: (context) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color.fromARGB(255, 247, 245, 245),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(67.0),
              child: AppBar(
                backgroundColor: Colors.white,
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return NotificationScreen();
                        },
                      ));
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/notification.jpg',
                          width: 30,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        )),
                  )
                ],
                leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(
                      255,
                      75,
                      75,
                      74,
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  'DASHBOARD',
                  style: GoogleFonts.aBeeZee(
                      color: const Color.fromARGB(
                        255,
                        75,
                        75,
                        74,
                      ),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            drawer: Drawer(
              backgroundColor: const Color.fromARGB(255, 219, 219, 220),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/scarlet.jpg')),
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
            body: const SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileCard(),
                      SizedBox(
                        height: 10,
                      ),
                      ApplyScholorshipCard(),
                      ApplicationStatus(),
                      SizedBox(
                        height: 15,
                      ),
                      UpcomingEvents(),
                      SizedBox(
                        height: 15,
                      ),
                      LatestNews(),
                      SizedBox(
                        height: 15,
                      ),
                      PhotoGallery(),
                      SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Expanded.png'), label: 'settings'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Group 869.png'), label: 'home'),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                  ),
                  label: 'profile'),
            ]),
          );
        });
      },
    );
  }
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPadding(
      paddingLeft: 9,
      paddingRight: 9,
      widget: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
        width: double.infinity,
        height: 308,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 227, 226, 226).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(children: [
          MyPadding(
            paddingTop: 5,
            widget: Row(
              children: [
                const Text(
                  'Photo Gallery',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 126),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const GalleryScreen();
                          },
                        ));
                      },
                      child: const Text("See All")),
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(2.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 222, 219, 219),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/scholorship1.jpg',
                width: 340,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/scholorship2.jpg',
                  width: 162,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/scholorship3.jpg',
                  width: 162,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

// class LatestNews extends StatelessWidget {
//   const LatestNews({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MyPadding(
//       paddingLeft: 9,
//       paddingRight: 9,
//       widget: Container(
//         width: 395,
//         height: 278,
//         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 255, 255, 255),
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           boxShadow: [
//             BoxShadow(
//               color: const Color.fromARGB(255, 227, 226, 226).withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             MyPadding(
//               paddingTop: 5,
//               widget: Row(
//                 children: [
//                   const Text(
//                     'Latest News',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 146),
//                     child: TextButton(
//                         onPressed: () {}, child: const Text("See All")),
//                   )
//                 ],
//               ),
//             ),
//             const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Divider(
//                   thickness: 1,
//                   color: Color.fromARGB(255, 222, 219, 219),
//                 )),
//             SizedBox(
//               height: 200,
//               width: 390,
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: const [
//                   // Create a widget for each news item
//                   NewsItemWidget(
//                     title:
//                         'Empowering Underprivileged Students: Pankaj Trust Expands its Scholarship Program',
//                     date: '16th Aug 2022 - 6:15pm',
//                     type: 'Lesson',
//                     imageUrl:
//                         "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8fDA%3D",
//                   ),
//                   SizedBox(height: 10),
//                   NewsItemWidget(
//                     title:
//                         'Pankaj Trust Celebrates Academic Excellence with Annual Scholarship Awards',
//                     date: '11th Dec 2023 - 9:15am',
//                     type: 'Scholorship',
//                     imageUrl:
//                         "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8fDA%3D",
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetNewsBloc>(context).add(const GetNews());
    });
    return MyPadding(
      paddingLeft: 9,
      paddingRight: 9,
      widget: Container(
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 227, 226, 226).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(children: [
          MyPadding(
            paddingTop: 5,
            widget: Row(
              children: [
                const Text(
                  ' Latest News',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 145),
                  child: TextButton(
                      onPressed: () {}, child: const Text("See All")),
                )
              ],
            ),
          ),
          const Divider(),
          BlocBuilder<GetNewsBloc, GetNewsState>(
            builder: (context, state) {
              if (state.isError) {
                // ignore: avoid_print
                print('error');
                return const Text('error');
              } else if (state.isLoading) {
                // ignore: avoid_print
                print('loading');
                return const CircularProgressIndicator();
              }
              if (state.news.data == null || state.news.data!.isEmpty) {
                return const Text('empty');
              }
              // ignore: avoid_print
              print('success');
              return Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final news = state.news.data?[index].news.toString() ?? '';
                    final date = state.news.data?[index].date.toString() ?? '';

                    return ListTile(
                      leading: const Icon(Icons.newspaper),
                      title: Column(
                        children: [
                          Text(
                            news,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              ((date)),
                              style: const TextStyle(fontSize: 9),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyPadding(
      paddingLeft: 9,
      paddingRight: 9,
      widget: Container(
        width: double.infinity,
        height: 240,
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 227, 226, 226).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyPadding(
              paddingTop: 5,
              widget: Row(
                children: [
                  const Text(
                    ' Upcoming Events',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: TextButton(
                        onPressed: () {}, child: const Text("See All")),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(2.0),
                child: Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 222, 219, 219),
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          // blurRadius: 2,
                          color: Color.fromARGB(54, 220, 220, 220),
                          // offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 160.4,
                                height: 80,
                                child: Image.network(
                                  "https://th.bing.com/th/id/OIP.idied9qK1gECV-iXPddGbQHaEc?rs=1&pid=ImgDetMain",
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 0, 0),
                                  child: Text(
                                    '2014',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          // blurRadius: 2,
                          color: Color.fromARGB(54, 212, 212, 216),
                          // offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 168,
                                height: 80,
                                child: Image.network(
                                  "https://mdxdubai.blob.core.windows.net/prod/images/default-source/scholarship-awards/scholarship-award-ceremony.jpg?sfvrsn=26ab5701_0",
                                  width: 10,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 0, 0),
                                  child: Text(
                                    '2015',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplicationStatus extends StatelessWidget {
  const ApplicationStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyPadding(
      paddingLeft: 9,
      paddingRight: 9,
      widget: Container(
        width: double.infinity,
        height: 180,
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 227, 226, 226).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyPadding(
              paddingTop: 9,
              widget: Text(
                ' Application Status',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(2.0),
                child: Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 222, 219, 219),
                )),
            MyPadding(
              widget: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 46.0,
                    lineWidth: 4.0,
                    animation: true,
                    percent: 0.7,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.green,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bachelor Of Architecture",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(221, 60, 60, 60),
                        ),
                      ),
                      Text(
                        "2020 - 2023",
                        style: TextStyle(
                          color: Color.fromARGB(221, 60, 60, 60),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final kwidth = MediaQuery.of(context).size.width;
    final kheight = MediaQuery.of(context).size.height;
    return Container(
      width: kwidth,
      height: 120,
      color: const Color.fromARGB(187, 206, 201, 201),
      child: MyPadding(
        paddingTop: 14,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/scarlet.jpg'),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Scarlet Johnson',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  'Bachelor of Architecture',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300, fontSize: 13),
                ),
                Text(
                  'College of Engineering Pune',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300, fontSize: 13),
                ),
                Text(
                  '2022',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300, fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ApplyScholorshipCard extends StatelessWidget {
  const ApplyScholorshipCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final kwidth = MediaQuery.of(context).size.width;
    final kheight = MediaQuery.of(context).size.width;
    return MyPadding(
      paddingLeft: 9,
      paddingRight: 9,
      widget: Container(
        width: double.infinity,
        height: 218,
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 227, 226, 226).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyPadding(
              paddingTop: 12,
              widget: Text(
                ' Apply For Scholorship',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(2.0),
                child: Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 222, 219, 219),
                )),
            const MyPadding(
              widget: Text(
                'Seize the opportunity to shape your academic destiny by submitting your application for the Pankaj Trust Scholarship today – a gateway to a future brimming with possibilities!',
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(221, 60, 60, 60),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: kwidth * 0.65,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 97, 86)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewsItemWidget extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final String imageUrl;

  const NewsItemWidget({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MyPadding(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align image to the end
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      type,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
