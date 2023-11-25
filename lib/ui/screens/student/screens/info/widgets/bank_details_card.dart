import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_mvvm/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/input_label.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/label_bottomSheet.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/label_inputText.dart';
import 'package:panakj_mvvm/ui/screens/student/widgets/spacer_height.dart';
import 'package:panakj_mvvm/ui/view_model/get_bank/get_bank_bloc.dart';

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
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  late Box<BankDB> bankBox;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> openBankBox() async {
      bankBox = await Hive.openBox<BankDB>('bankBox');
    }

    openBankBox();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<GetBankBloc>(context)
          .add(const GetBankEvent.getBankList());
    });
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelInputText(
              label: 'Full name (As per bank record)',
              StringInput: widget.nameController),
          const HeightSpacer(height: 14),
          LabelInputText(
              label: 'Account Number', StringInput: widget.accNoController),
          const HeightSpacer(height: 14),
          InputLabel(mytext: 'Bank Name'),
          BlocConsumer<GetBankBloc, GetBankState>(
            listener: (context, state) {
              (either) {
                either.fold(
                  (failure) {
                    if (failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('failed to fetch bank data '),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(success),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    // ignore: avoid_print
                    print(success);
                  },
                );
              };
            },
            builder: (context, state) {
              if (state.bank == null || state.bank.data == null) {
                //   //we retrieve data from hive db
                //   if (bankBox != null) {
                //     List<String> bankNames =
                //         bankBox!.values.map((e) => e.name).toList();
                //         return labelBottomSheet(
                //     title: 'Bank Details',
                //     hintText: 'Search For Bank',
                //     listofData: bankNames,
                //   );
                //     // Do something with bankNames
                //   } else {
                return labelBottomSheet(
                  title: 'Bank Details',
                  hintText: 'Search For Bank',
                  listofData: const [],
                );
              }
              if (state.isLoading) {
                return labelBottomSheet(
                  title: 'Bank Details',
                  hintText: 'Search For Bank',
                  listofData: const [],
                );
              } else if (state.isError) {
                return labelBottomSheet(
                  title: 'Bank Details',
                  hintText: 'Search For Bank',
                  listofData: const [],
                );
              } else {
                // we store our data to hive db
                for (var bankData in state.bank.data!) {
                  String key = bankData.id.toString();
                  bankBox.put(
                    key,
                    BankDB(
                      id: bankData.id as int,
                      name: bankData.name as String,
                      deletedAt: 'delete',
                    ),
                  );
                }
                //we retrieve data from hive db
                List<String> bankNames =
                    bankBox.values.map((e) => e.name).toList();

                return labelBottomSheet(
                  title: 'Bank Details',
                  hintText: 'Search For Bank',
                  listofData: bankNames,
                );
              }
            },
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























//  listofData: const [
//                   ' ALLAHABAD BANK',
//                   'ANDHRA BANK',
//                   'AXIS BANK',
//                   'BANK OF BARODA',
//                   'BANK OF INDIA',
//                   'BANK OF MAHARASHTRA',
//                   'CANARA BANK',
//                   'CORPORATION BANK',
//                   'HONG KONG & SHANGHAI BANK (HSBC)',
//                   'INDIAN BANK',
//                   'INDIAN OVERSEAS BANK',
//                   'KARUR VYSYA BANK',
//                   'NORTH MALABAR GRAMIN BANK',
//                   'ORIENTAL BANK OF COMMERCE',
//                   'PUNJAB AND SIND BANK',
//                   'PUNJAB NATIONAL BANK',
//                   'RESERVE BANK OF INDIA',
//                   'SOUTH INDIAN BANK',
//                   'STANDARD CHARTERED BANK',
//                   'STATE BANK OF BIKANER AND JAIPUR',
//                   'STATE BANK OF HYDERABAD',
//                   'STATE BANK OF MYSORE',
//                   'STATE BANK OF PATIALA',
//                   'STATE BANK OF TRAVANCORE',
//                   'SYNDICATE BANK',
//                   'LAKSHMI VILAS BANK LTD ',
//                   'CENTRAL BANK OF INDIA',
//                   'DENA BANK',
//                   'BANDHAN BANK LIMITED',
//                   'KERALA GRAMIN BANK',
//                   'LAXMI VILAS BANK',
//                   'BANK OF BAHARAIN AND KUWAIT BSC',
//                   'BHARATIYA MAHILA BANK LIMITED',
//                   'CATHOLIC SYRIAN BANK',
//                   'CITIBANK NA (CITY)',
//                   'CITY UNION BANK LTD',
//                   'DEVELOPMENT CREDIT BANK',
//                   'DHANALAXMI BANK',
//                   'DOHA BANK1 branch',
//                   'FEDERAL BANK LTD ',
//                   'HDFC BANK LTD',
//                   'ICICI BANK LTD',
//                   'IDBI BANK LTD',
//                   'ING VYSYA BANK LTD',
//                   'INDUSIND BANK LTD',
//                   'JAMMU AND KASHMIR BANK LTD',
//                   'KARNATAKA BANK LTD',
//                   'KOTAK MAHINDRA BANK',
//                   'STATE BANK OF INDIA',
//                   'TAMILNAD MERCANTILE BANK LTD',
//                   'YES BANK LTD',
//                 ],
             