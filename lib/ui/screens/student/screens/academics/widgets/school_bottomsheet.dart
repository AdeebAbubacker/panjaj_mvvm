import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/core/db/adapters/school_adapter/school_adapter.dart';
import 'package:panakj_app/ui/view_model/search_school/search_school_bloc.dart';


class schoolBottomSheet extends StatefulWidget {
  final bottomSheetheight;
  final String title;
  final hintText;
  List<String> listofData = [];

  schoolBottomSheet(
      {Key? key,
      this.listofData = const [
        'Nil',
        'Agriculture',
        'Fishing',
        'Plumbing',
        'Painting',
        'Soldier',
        'Policeman',
        'Driver',
        'Clerk',
        "Office Staff",
        'Supervisor',
        'Able Seamen',
        'Accountants',
        'Auditors',
        'Actors',
        'Actuaries',
        'Acupuncturists',
        'Acute Care Nurses',
        'Education Specialists',
        'Adjustment Clerks',
        'Administrative Law Judges',
        'Adjudicators',
        'Hearing Officers',
        'Administrative Services Managers',
        'Adult Literacy',
        'Remedial Education',
        'GED Teachers and Instructors',
        'Advanced Practice Psychiatric Nurses',
        'Advertising and Promotions Managers',
        'Advertising Sales Agents',
        'Aerospace Engineering and Operations Technicians',
        'Aerospace Engineers',
      ],
      required this.title,
      this.bottomSheetheight = 0.9,
      this.hintText})
      : super(key: key);

  @override
  State<schoolBottomSheet> createState() => _schoolBottomSheetState();
}

class _schoolBottomSheetState extends State<schoolBottomSheet> {
  late Box<SchoolDB> schoolBox;
  List<String> schoolNames = [];
  @override
  void initState() {
    super.initState();

    setupSchoolBox();
  }

  Future<void> setupSchoolBox() async {
    schoolBox = await Hive.openBox<SchoolDB>('schoolBox');

    if (!schoolBox.isOpen) {
      print('schoolBox is not open');
      return;
    }

    List<int> keys = schoolBox.keys.cast<int>().toList();

    print('All keys in schoolBox: $keys');

    if (keys.isEmpty) {
      print('No banks found in schoolBox');
      return;
    }

    // Extract names from BankDB objects
    schoolNames = keys.map((key) {
      SchoolDB school = schoolBox.get(key)!;
      return school.name;
    }).toList();

    // Ensure that the widget is rebuilt after the bankNames are populated
    if (mounted) {
      setState(() {});
    }
  }

  final List<String> emptyList = [];
  final TextEditingController textController = TextEditingController();

  void _showModal(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.2,
              maxChildSize: widget.bottomSheetheight,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 1, left: 6),
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 92, 91, 90),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: kredColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 500,
                      height: 1,
                      color: const Color.fromARGB(255, 211, 211, 208),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 14, top: 8, right: 14, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (textController) {
                                BlocProvider.of<SearchSchoolBloc>(context).add(
                                    GetSchool(schoolQuery: textController));
                              },
                              style: kCardContentStyle,
                              controller: textController,
                              decoration: InputDecoration(
                                hintText: widget.hintText,
                                contentPadding: const EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: IconButton(
                                    icon: const Icon(FontAwesomeIcons.eraser,
                                        size: 24,
                                        color:
                                            Color.fromARGB(255, 140, 138, 138)),
                                    color: const Color(0xFF1F91E7),
                                    onPressed: () {
                                      setState(
                                        () {
                                          textController.clear();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SearchSchoolBloc, SearchSchoolState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state.isError) {
                            return const Center(
                              child: Text('Error fetching data'),
                            );
                          } else {
                            return ListView.separated(
                              controller: scrollController,
                              itemCount: textController.text.isEmpty
                                  ? schoolBox.length
                                  : state.school.data?.data?.length ??
                                      emptyList.length,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: (state.school.data != null &&
                                          state.school.data!.data!.isNotEmpty)
                                      ? showBottomSheetData(index,
                                          state.school.data!.data!.toList())
                                      : showBottomSheetData(index, emptyList),
                                  onTap: () {
                                    textController.text =
                                        state.school.data!.data![index].name!;
                                    // ignore: avoid_print
                                    print(
                                        'Selected item in bottom sheet----------$index');
                                  },
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget showBottomSheetData(int index, List data) {
    final isFirstItem = index == 0;
    final isLastItem = index == data.length - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isFirstItem)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          ),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 10, left: 14),
          child: Text(
            textController.text.isEmpty ? schoolNames[index] : data[index].name,
       
            style: const TextStyle(
              color: Color.fromARGB(255, 84, 84, 84),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        if (isLastItem)
          const Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Devicewidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: Devicewidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 136, 133, 133),
                      width: 1.0,
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: TextFormField(
                    style: kCardContentStyle,
                    readOnly: true,
                    maxLines: 1,
                    controller: textController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon:
                          Icon(Icons.arrow_drop_down, color: Colors.black),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _showModal(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(1.0),
                  child: SizedBox(
                    width: 370,
                    height: 48,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
