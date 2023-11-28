import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/core/db/boxes/personal_info_box.dart';
import 'package:panakj_app/package/presentation/custom_stepper.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/academics_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/screens/achievments_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/family/screens/family_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/home/screens/home_screen.dart';
import 'package:panakj_app/ui/screens/student/screens/info/screens/info_layout.dart';
import 'package:panakj_app/ui/screens/student/widgets/bottom_card.dart';
import 'package:panakj_app/ui/screens/student/widgets/next_and_previous_button.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_app/ui/view_model/Dob/dob_bloc.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_app/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_app/ui/view_model/students_app_form/students_app_form_bloc.dart';
import 'package:intl/intl.dart';

class StudentsApplicationForm extends StatefulWidget {
  StudentsApplicationForm({super.key});

  @override
  State<StudentsApplicationForm> createState() =>
      _StudentsApplicationFormState();
}

class _StudentsApplicationFormState extends State<StudentsApplicationForm> {
  // late Box<personalInfoDB> personalInfoBox;
  @override
  void initState() {
    super.initState();
    // personalInfo();
  }

  // void personalInfo() async {
  //   personalInfoBox = await Hive.openBox<personalInfoDB>('personalInfoBox');
  //   // setState ensures that the build method is called again with the updated state
  //   setState(() {});
  // }

  ScrollController scrollController = ScrollController();

  // 1st Section
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNoController = TextEditingController();

  TextEditingController nameatBankController = TextEditingController();

  TextEditingController accNoController = TextEditingController();

  TextEditingController ifscController = TextEditingController();

  //2nd Section
  TextEditingController fatherincomeController = TextEditingController();

  TextEditingController motherincomeController = TextEditingController();

  TextEditingController guardiaincomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = context.read<DobBloc>().state.selectedDate;
    return Scaffold(
      body: BlocBuilder<StudentsAppFormBloc, StudentsAppFormState>(
        builder: (context, state) {
          void handleNextPage(int step) {
            context
                .read<StudentsAppFormBloc>()
                .add(DoYouHaveBankAccEvent(currentStep: step));
          }

          void handlePrevious(int step) {
            context
                .read<StudentsAppFormBloc>()
                .add(DoYouHaveBankAccEvent(currentStep: step));
          }

          return CustomStepper(
            currentPage: state.currentStep,
            scrollController: scrollController,
            steps: [
              AddStep(
                status: personalInfoBox.get('key')?.status == true
                    ? 'Completed'
                    : 'Progress',
                stepIcon: personalInfoBox.get('key')?.status == true
                    ? Icons.check
                    : Icons.school_rounded,
                title: 'Info',
                content: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      InfoLayout(
                        title: 'Personal Info',
                        nameController: nameController,
                        addressController: addressController,
                        emailController: emailController,
                        phoneNoController: phoneNoController,
                        nameatBankController: nameatBankController,
                        accNoController: accNoController,
                        ifscController: ifscController,
                      ),
                      const HeightSpacer(),
                      BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
                        listener: (context, state) {
                          state.successorFailure.fold(
                            () {},
                            (either) {
                              either.fold(
                                (failure) {
                                  // ignore: avoid_print
                                  print(failure.toString());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(failure.toString())));
                                },
                                (success) {
                                  // personalInfoBox.put(
                                  //   'key',
                                  //   personalInfoDB(
                                  //     status: true,
                                  //   ),
                                  // );
                                  // ignore: avoid_print
                                  print(success.data.toString());
                                  scrollController.jumpTo(0.0);
                                  handleNextPage(1);
                                },
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return BottomCard(
                            nextBtn: InkResponse(
                              onTap: () {
                                BlocProvider.of<PersonalInfoBloc>(context).add(
                                  PostPersonalInfo(
                                    name: nameController.text,
                                    gender: context
                                                .read<HorizontalRadioBtnBloc>()
                                                .state
                                                .groupValue ==
                                            1
                                        ? "m"
                                        : "f",
                                    dob: DateFormat('yyyy-MM-dd').format(context
                                        .read<DobBloc>()
                                        .state
                                        .selectedDate),
                                    phone: phoneNoController.text,
                                    address: addressController.text,
                                    email: emailController.text,
                                    bankaccname: nameatBankController.text,
                                    bankaccno: accNoController.text,
                                    bankname: "sbi",
                                    bankifsc: ifscController.text,
                                  ),
                                );
                              },
                              child: const StepperBtn(
                                nextorprev: 'Next',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              AddStep(
                title: 'Family',
                content: Column(
                  children: [
                    FamilyScreen(
                      fatherincomeController: fatherincomeController,
                      motherincomeController: motherincomeController,
                      guardiaincomeController: guardiaincomeController,
                    ),
                    const HeightSpacer(),
                    BottomCard(
                      prevBtn: InkResponse(
                          onTap: () {
                            scrollController.jumpTo(0.0);
                            handlePrevious(0);
                          },
                          child: const StepperBtn(nextorprev: 'Prev')),
                      nextBtn: InkResponse(
                          onTap: () {
                            scrollController.jumpTo(0.0);
                            handleNextPage(2);
                          },
                          child: const StepperBtn(nextorprev: 'Next')),
                    ),
                  ],
                ),
                stepIcon: Icons.family_restroom,
                status: 'To do',
              ),
              AddStep(
                title: 'Academics',
                content: Column(
                  children: [
                    const AcademicsScreen(),
                    const HeightSpacer(),
                    const AchievmentsScreen(),
                    BottomCard(
                      prevBtn: InkResponse(
                        onTap: () {
                          scrollController.jumpTo(0.0);
                          handlePrevious(1);
                        },
                        child: const StepperBtn(nextorprev: 'Prev'),
                      ),
                      nextBtn: InkResponse(
                          onTap: () {
                            scrollController.jumpTo(0.0);
                            handleNextPage(3);
                          },
                          child: const StepperBtn(
                            nextorprev: 'Next',
                          )),
                    ),
                  ],
                ),
                stepIcon: Icons.school_rounded,
                status: 'Completed',
              ),
              AddStep(
                title: 'Home',
                content: Column(
                  children: [
                    const HomeScreen(),
                    const HeightSpacer(),
                    BottomCard(
                      prevBtn: InkResponse(
                        onTap: () {
                          scrollController.jumpTo(0.0);
                          handlePrevious(2);
                        },
                        child: const StepperBtn(nextorprev: 'Prev'),
                      ),
                    ),
                  ],
                ),
                stepIcon: Icons.home,
                status: 'Progress',
              ),
            ],
            config: StepConfig(
              activeConfig: AcitiveUi(),
              inactiveConfig: InacitiveUi(
                iconBgColor: Colors.black45,
              ),
            ),
          );
        },
      ),
    );
  }
}
