import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:panakj_app/core/db/adapters/bank_adapter/bank_adapter.dart';
import 'package:panakj_app/ui/screens/student/widgets/label_bottomSheet.dart';

class BankListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Box<BankDB> bankBox = Hive.box<BankDB>('bankBox');

    if (!bankBox.isOpen) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    List<int> keys = bankBox.keys.cast<int>().toList();

    if (keys.isEmpty) {
      return const Center(
        child: Text('No banks found'),
      );
    }

    // Extract names from BankDB objects
    List<String> bankNames = keys.map((key) {
      BankDB bank = bankBox.get(key)!;
      return bank.name;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank List'),
      ),
      body: labelBottomSheet(title: 'ss', listofData: bankNames),
    );
  }
}

