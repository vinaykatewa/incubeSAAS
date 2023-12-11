import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:incube/uiThemes.dart';

class UserImage extends StatefulWidget {
  const UserImage({super.key, required this.onPickedImage});
  final void Function(String? pickImage) onPickedImage;

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  String _imageFile = ''; // Variable to hold the selected image file
  Uint8List? selectedImageInBytes;
  void pickImage() async {
    try {
      // Pick image using file_picker package
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user picks an image, save selected image to variable
      if (fileResult != null) {
        setState(() {
          _imageFile = fileResult.files.first.name;
          selectedImageInBytes = fileResult.files.first.bytes;
        });
      }
    } catch (e) {
      // If an error occured, show SnackBar with error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error:$e")));
    }
  }

  void submitImage(String uintImg) {
    widget.onPickedImage(uintImg);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_imageFile.isNotEmpty || _imageFile != '')
            Container(
              height: 10,
              child: Image.memory(selectedImageInBytes!),
            ),
          const SizedBox(height: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MainBorderRadius()),
              ),
            ),
            onPressed: () {
              // Calling pickImage Method
              pickImage();
            },
            child: Text(
              'Pick Image',
              style: BodySmall().copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MainBorderRadius()),
              ),
            ),
            onPressed: () async {
              // Calling uploadImage Method
              submitImage(_imageFile);
            },
            child: Text('Upload Image To Firebase Storage',
                style: BodySmall().copyWith(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
