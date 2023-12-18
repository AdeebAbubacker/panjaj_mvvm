import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/personal_info_adapter/personal_info_adapter.dart';
import 'package:panakj_app/core/db/boxes/personal_info_box.dart';
import 'package:panakj_app/core/model/personal_info/personal_info.dart';
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
import 'package:panakj_app/ui/view_model/familyInfo/family_info_bloc.dart';
import 'package:panakj_app/ui/view_model/horizontal_radio_btn/horizontal_radio_btn_bloc.dart';
import 'package:panakj_app/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_app/ui/view_model/students_app_form/students_app_form_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class StudentsApplicationForm extends StatefulWidget {
  const StudentsApplicationForm({super.key});

  @override
  State<StudentsApplicationForm> createState() =>
      _StudentsApplicationFormState();
}

class _StudentsApplicationFormState extends State<StudentsApplicationForm> {
  late Box<personalInfoDB> personalInfoBox;
  @override
  void initState() {
    super.initState();
    personalInfo();
  }

  void personalInfo() async {
    personalInfoBox = await Hive.openBox<personalInfoDB>('personalInfoBox');
    // setState ensures that the build method is called again with the updated state
    setState(() {});
  }

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
    FocusNode focuscontroller1 = FocusNode();
    FocusNode focuscontroller2 = FocusNode();
    FocusNode focuscontroller3 = FocusNode();
    FocusNode focuscontroller4 = FocusNode();
    FocusNode focuscontroller5 = FocusNode();
    FocusNode focuscontroller6 = FocusNode();
    FocusNode focuscontroller7 = FocusNode();
    FocusNode focuscontroller8 = FocusNode();
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

          List<FocusNode> focusControllers = [
            focuscontroller1,
            focuscontroller2,
            focuscontroller3,
            focuscontroller4,
            focuscontroller5,
            focuscontroller6,
            focuscontroller7,
            focuscontroller8,
          ];

          return GestureDetector(
            onTap: () {
              for (var focusController in focusControllers) {
                if (focusController.hasFocus) {
                  focusController.unfocus();
                }
              }
            },
            child: CustomStepper(
              currentPage: state.currentStep,
              scrollController: scrollController,
              steps: [
                AddStep(
                  // status: personalInfoBox.get('key')?.status == true
                  //     ? 'Completed'
                  //     : 'Progress',
                  status: 'Progress',
                  // stepIcon: personalInfoBox.get('key')?.status == true
                  //     ? Icons.check
                  //     : Icons.school_rounded,
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
                          infonamefocusNode: focuscontroller1,
                          infoaddressfocusNode: focuscontroller2,
                          numericalfocusnode: focuscontroller3,
                          emailfocusnode: focuscontroller4,
                          banknamefocusnode: focuscontroller5,
                          accnofocusnode: focuscontroller6,
                          bankifscfocusnode: focuscontroller7,
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
                                    personalInfoBox.put(
                                      'key',
                                      personalInfoDB(
                                        name: nameController.text,
                                        gender: true,
                                        dob: selectedDate,
                                        address: addressController.text,
                                        mobno: 888,
                                        email: emailController.text,
                                        doyouHaveBankAcc: true,
                                        nameasPerBank:
                                            nameatBankController.text,
                                        AccNumber: 000000000000,
                                        bankName: "Federal Bank",
                                        BranchIFSC: "IFSC0808",
                                      ),
                                    );
                                    for (var data in personalInfoBox.values) {
                                      print(
                                          'data from personal info box: $data');

                                      print('name from db: ${data.name}');
                                      print('gender from db: ${data.gender}');
                                      print('dob from db: ${data.dob}');
                                      print('address from db: ${data.address}');
                                      print('mobno from db: ${data.mobno}');
                                      print('email from db: ${data.email}');
                                      print(
                                          'do you have from db: ${data.doyouHaveBankAcc}');
                                      print(
                                          'name as per bank from db: ${data.nameasPerBank}');
                                      print(
                                          'acc number from db: ${data.AccNumber}');
                                      print(
                                          'bank Name from db: ${data.bankName}');
                                      print(
                                          'Branch IFSC from db: ${data.BranchIFSC}');
                                    }
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
                                  BlocProvider.of<PersonalInfoBloc>(context)
                                      .add(
                                    PostPersonalInfo(
                                      name: nameController.text,
                                      gender: context
                                                  .read<
                                                      HorizontalRadioBtnBloc>()
                                                  .state
                                                  .groupValue ==
                                              1
                                          ? "m"
                                          : "f",
                                      dob: DateFormat('yyyy-MM-dd').format(
                                          context
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
                        realtionfocusNode: focuscontroller1,
                        fatherfocusNode: focuscontroller2,
                        motherfocusNode: focuscontroller3,
                        guardianfocusNode: focuscontroller4,
                        fathericomefocusnode: focuscontroller5,
                        mothericomefocusnode: focuscontroller6,
                        guardianicomefocusnode: focuscontroller7,
                        siblingnamefocusNode: focuscontroller8,
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
                              BlocProvider.of<FamilyInfoBloc>(context).add(
                                const PostFamilyInfo(
                                    name: "Rishi",
                                    relation: "son",
                                    phone: "3534",
                                    email: "sfh@gmail.com",
                                    highest_qualification: "mca",
                                    occupation: "farmer",
                                    income: "345",
                                    alive: "1",
                                    disabled: "1",
                                    siblingname: "dgg",
                                    siblinggender: "f",
                                    siblingsqualification: "4",
                                    siblingscourse: "3",
                                    siblingsoccuptaion: "2"),
                              );
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
                      AcademicsScreen(
                        examRegfocusnode: focuscontroller1,
                        sslcfocusnode: focuscontroller2,
                        plusonefocusnode: focuscontroller3,
                        plustwofocusnode: focuscontroller4,
                      ),
                      const HeightSpacer(),
                      AchievmentsScreen(focusNode: focuscontroller5),
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
                      HomeScreen(landfocusNode: focuscontroller1),
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
            ),
          );
        },
      ),
    );
  }
}
