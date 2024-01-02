import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

import '../../authentication/userImage.dart';
import 'package:aws_common/web.dart';

class AddDeal extends StatefulWidget {
  const AddDeal({Key? key});

  @override
  State<AddDeal> createState() => _AddDealState();
}

class _AddDealState extends State<AddDeal> {
  final amplifyFunction = AwsIncube();
  String _imageUrl = 'initial image path';
  String? selectedImage;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();
  TextEditingController seekingController = TextEditingController();

  void onImagePicked(String? image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    // Future<String> uploadHtmlFile(String imageData) async {
    //   safePrint('file uploading is starting');
    //   final bytes = imageData.codeUnits;
    //   final awsFile = AWSFilePlatform.fromData(bytes);
    //   final fileName = DateTime.now().toIso8601String();
    //   try {
    //     safePrint('trying to uoplaod file');
    //     final uploadResult = await Amplify.Storage.uploadFile(
    //       localFile: awsFile,
    //       key: fileName,
    //     ).result;
    //     safePrint('file uplaoded successfully');
    //     safePrint('Uploaded file: ${uploadResult.uploadedItem.key}');
    //     return uploadResult.uploadedItem.key;
    //   } on StorageException catch (e) {
    //     safePrint('Error uploading file: ${e.message}');
    //     rethrow;
    //   }
    // }

    Future<void> storingImage() async {
      // final imageKey = await uploadHtmlFile(selectedImage!);
      // final result = await Amplify.Storage.getUrl(key: imageKey).result;
      // setState(() {
      //   _imageUrl = result.url.toString();
      // });
      // safePrint('here is your download url');
      // safePrint(_imageUrl);
    }
    void clearAll() {
      companyNameController.clear();
      companyDescriptionController.clear();
      seekingController.clear();
    }

    Future<void> submit() async {
      await storingImage().whenComplete(() async {
        final _deals = Deals(
            company_logo: _imageUrl,
            company_name: companyNameController.text,
            company_description: companyDescriptionController.text,
            seeking: seekingController.text,
            status: "review pending",
            teamId: 'teamprary');
        await amplifyFunction
            .addDeals(_incubeProvider.superAdmin, _deals)
            .whenComplete(() {
          clearAll();
        });
      });
    }

    return Card(
      child: Column(
        children: [
          // Company Name Field
          TextFormField(
            controller: companyNameController,
            decoration: InputDecoration(
              labelText: 'Company Name',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 16.0),

          // Company Description Field
          TextFormField(
            controller: companyDescriptionController,
            decoration: InputDecoration(
              labelText: 'Company Description',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 16.0),

          // Seeking Field
          TextFormField(
            controller: seekingController,
            decoration: InputDecoration(
              labelText: 'Seeking',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 16.0),
          UserImage(onPickedImage: onImagePicked),
          SizedBox(height: 16.0),

          // Clear and Submit Buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  clearAll();
                },
                child: Text('Clear'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  submit();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
