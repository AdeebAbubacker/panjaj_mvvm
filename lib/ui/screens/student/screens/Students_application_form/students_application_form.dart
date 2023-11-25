import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_mvvm/package/presentation/custom_stepper.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/academics/screens/academics_screen.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/academics/screens/achievments_screen.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/family/screens/family_screen.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/home/screens/home_screen.dart';
import 'package:panakj_mvvm/ui/screens/student/screens/info/screens/info_layout.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/bottom_card.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/next_and_previous_button.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_mvvm/ui/view_model/Dob/dob_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_mvvm/ui/view_model/students_app_form/students_app_form_bloc.dart';

class StudentsApplicationForm extends StatelessWidget {
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

  StudentsApplicationForm({super.key});
  @override
  Widget build(BuildContext context) {
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
                status: 'Progress',
                stepIcon: Icons.school_rounded,
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(failure.toString())));
                                },
                                (success) {
                                  // ignore: avoid_print
                                  print(success.toString());
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
                                    dob: context.read<DobBloc>().state.selectedDate.toString(),
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
