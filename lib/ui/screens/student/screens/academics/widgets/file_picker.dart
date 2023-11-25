import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FilePickerScreen extends StatefulWidget {
  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? fileName = '';
  String? filePath = '';
  bool myVisibility = false;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path!;
        fileName = basename(filePath!);
        print("Selected file: $fileName");
        _visible(); // Call visibility check
      });
    } else {
      // User canceled the file picking
    }
  }

  void _deleteFile() {
    setState(() {
      filePath = '';
      fileName = '';
      _visible(); // Call visibility check
    });
  }

  void _visible() {
    setState(() {
      myVisibility = fileName != '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: _openFilePicker,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.file_present),
                    Text('Upload file'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Visibility(
                visible: myVisibility,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: _deleteFile,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                fileName!,
                style: const TextStyle(color: Colors.brown, fontSize: 7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


    // const SizedBox(
    //             width: 10,
    //           ),
    //           fileName == ''
    //               ? Container()
    //               : Image.file(
    //                   File(filePath!),
    //                   height: 30,
    //                   width: 30,
    //                   fit: BoxFit.cover,
    //                 ), // Display image only if a file is selected