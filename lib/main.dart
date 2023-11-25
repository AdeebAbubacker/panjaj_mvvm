import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_mvvm/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_mvvm/core/db/boxes/bank_box.dart';
import 'package:panakj_mvvm/ui/screens/auth/splash_screen.dart';
import 'package:panakj_mvvm/ui/view_model/Dob/dob_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/add_achievment/add_achievment_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/auth/auth_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/family/family_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/get_bank/get_bank_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/students_app_form/students_app_form_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BankDBAdapter());
  bankBox = await Hive.openBox<BankDB>('bankBox');
  runApp(const MyApp());
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(),
        home: const SplashScreen(),
       
      ),
    );
  }
}
