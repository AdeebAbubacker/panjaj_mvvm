import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/course_adapter/course_adapter.dart';
import 'package:panakj_app/core/db/adapters/family_success_status/family_status_adapter.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/core/db/boxes/bank_box.dart';
import 'package:panakj_app/core/db/boxes/course_box.dart';
import 'package:panakj_app/core/db/boxes/family_status_box.dart';
import 'package:panakj_app/core/db/boxes/personal_info_box.dart';
import 'package:panakj_app/core/db/boxes/school_box.dart';
import 'package:panakj_app/ui/view_model/Dob/dob_bloc.dart';
import 'package:panakj_app/ui/view_model/acadmicdetails/academic_bloc.dart';
import 'package:panakj_app/ui/view_model/add_achievment/add_achievment_bloc.dart';
import 'package:panakj_app/ui/view_model/auth/auth_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxfirst/checkboxfirst_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxsec/checkboxsec_bloc.dart';
import 'package:panakj_app/ui/view_model/checkboxthird/checkboxthird_bloc.dart';

import 'package:panakj_app/ui/view_model/family/family_bloc.dart';
import 'package:panakj_app/ui/view_model/familyInfo/family_info_bloc.dart';
import 'package:panakj_app/ui/view_model/gallery/gallery_bloc.dart';
import 'package:panakj_app/ui/view_model/get_dropdown_values/get_dropdown_values_bloc.dart';
import 'package:panakj_app/ui/view_model/get_news/get_news_bloc.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_app/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_app/ui/view_model/search_bank/get_bank_bloc.dart';
import 'package:panakj_app/ui/view_model/search_courses/courses_bloc.dart';
import 'package:panakj_app/ui/view_model/search_school/search_school_bloc.dart';
import 'package:panakj_app/ui/view_model/students_app_form/students_app_form_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/ui/screens/auth/splash_screen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BankDBAdapter());
  Hive.registerAdapter(personalInfoDBAdapter());
  Hive.registerAdapter(CourseDBAdapter());
  Hive.registerAdapter(SchoolDBAdapter());
  Hive.registerAdapter(FamilyStatusDBAdapter());

  bankBox = await Hive.openBox<BankDB>('bankBox');
  personalInfoBox = await Hive.openBox<personalInfoDB>('personalInfoBox');
  courseBox = await Hive.openBox<CourseDB>('courseBox');
  schoolBox = await Hive.openBox<SchoolDB>('schoolBox');
  familystatusInfoBox =
      await Hive.openBox<FamilyStatusDB>('familystatusInfoBox');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HorizontalRadioBtnBloc(),
        ),
        BlocProvider(
          create: (context) => StudentsAppFormBloc(),
        ),
        BlocProvider(
          create: (context) => FamilyBloc(),
        ),
        BlocProvider(
          create: (context) => AddAchievmentBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => PersonalInfoBloc(),
        ),
        BlocProvider(
          create: (context) => DobBloc(),
        ),
        BlocProvider(
          create: (context) => GetBankBloc(),
        ),
        BlocProvider(
          create: (context) => FamilyInfoBloc(),
        ),
        BlocProvider(
          create: (context) => GetDropdownValuesBloc(),
        ),
        BlocProvider(
          create: (context) => CoursesBloc(),
        ),
        BlocProvider(
          create: (context) => SearchSchoolBloc(),
        ),
        BlocProvider(
          create: (context) => GalleryBloc(),
        ),
        BlocProvider(
          create: (context) => GetNewsBloc(),
        ),
        BlocProvider(
          create: (context) => AcademicBloc(),
        ),
        BlocProvider(
          create: (context) => CheckboxfirstBloc(),
        ),
        BlocProvider(
          create: (context) => CheckboxsecBloc(),
        ),
        BlocProvider(
          create: (context) => CheckboxthirdBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(useMaterial3: false),
        home: const SplashScreen(),
      ),
    );
  }
}
