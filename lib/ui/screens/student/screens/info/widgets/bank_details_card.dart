// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
// import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
// import 'package:panakj_app/ui/screens/student/widgets/label_bottomSheet.dart';
// import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
// import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

// class BankCard extends StatelessWidget {
//   bool mybool;
//   final width;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController accNoController = TextEditingController();
//   TextEditingController ifscController = TextEditingController();
//   BankCard({
//     super.key,
//     this.width,
//     required this.mybool,
//     required this.nameController,
//     required this.accNoController,
//     required this.ifscController,
//   });

//   @override
//   Widget build(BuildContext context) {

//     // if (keys.isEmpty) {
//     //   print('bankbox open values2 - ${bankBox.values}');
//     //   return const Center(
//     //     child: Text('No banks found'),
//     //   );
//     // }

//     // Extract names from BankDB objects

//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           LabelInputText(
//               label: 'Full name (As per bank record)',
//               StringInput: nameController),
//           const HeightSpacer(height: 14),
//           LabelInputText(label: 'Account Number', StringInput: accNoController),
//           const HeightSpacer(height: 14),
//           InputLabel(mytext: 'Bank Name'),
//           labelBottomSheet(
//             title: 'Bank Details',
//             hintText: 'Search For Bank',
//             listofData: [],
//           ),
//           const HeightSpacer(height: 14),
//           LabelInputText(
//             label: 'Branch IFSC',
//             StringInput: ifscController,
//           ),
//           const HeightSpacer(height: 14),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_bottomSheet.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

import 'package:hive/hive.dart';

class BankCard extends StatefulWidget {
  bool mybool;
  final width;
  TextEditingController nameController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  BankCard({
    super.key,
    this.width,
    required this.mybool,
    required this.nameController,
    required this.accNoController,
    required this.ifscController,
  });

  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  late Box<BankDB> bankBox; // Declare bankBox at the class level
  List<String> bankNames = []; // List to hold bank names

  @override
  void initState() {
    super.initState();
    setupBankBox();
  }

  Future<void> setupBankBox() async {
    bankBox = await Hive.openBox<BankDB>('bankBox');

    if (!bankBox.isOpen) {
      print('bankBox is not open');
      return;
    }

    List<int> keys = bankBox.keys.cast<int>().toList();

    print('All keys in bankBox: $keys');

    if (keys.isEmpty) {
      print('No banks found in bankBox');
      return;
    }

    // Extract names from BankDB objects
    bankNames = keys.map((key) {
      BankDB bank = bankBox.get(key)!;
      return bank.name;
    }).toList();

    print('Bank names: $bankNames');

    // Ensure that the widget is rebuilt after the bankNames are populated
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelInputText(
            label: 'Full name (As per bank record)',
            StringInput: widget.nameController,
          ),
          const HeightSpacer(height: 14),
          LabelInputText(
            label: 'Account Number',
            StringInput: widget.accNoController,
          ),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Bank Name'),
          labelBottomSheet(
            title: 'Bank Details',
            hintText: 'Search For Bank',
            listofData: bankNames,
          ),
          const HeightSpacer(height: 14),
          LabelInputText(
            label: 'Branch IFSC',
            StringInput: widget.ifscController,
          ),
          const HeightSpacer(height: 14),
        ],
      ),
    );
  }
}
