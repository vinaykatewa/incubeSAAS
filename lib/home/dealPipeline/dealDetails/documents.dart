import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/home/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/home/dealPipeline/dealDetails/pdfReader.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    gettingDocument();
  }

  void gettingDocument() async {
    setState(() {
      isLoading = true;
    });
    //iterate the name list
    final DealDetailsProvider detailProvider =
        Provider.of<DealDetailsProvider>(context, listen: false);
    final ApiCalls apiCalls = ApiCalls();
    for (String s in detailProvider.documentsName) {
      String? ourDoc = await apiCalls.getItemByName(s);
      if (ourDoc == null) {
        safePrint('In gettingDocument, we got ourDoc as null');
        return;
      }
      detailProvider.addDocument(ourDoc);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LinearProgressIndicator()
        : Consumer<DealDetailsProvider>(
            builder: (context, provider, child) {
              return Card(
                elevation: 5.0,
                color: tertiaryColor2(),
                shadowColor: secondaryColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MainBorderRadius()),
                ),
                child: ListView.builder(
                  itemCount: provider.documentsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5.0,
                      color: tertiaryColor1(),
                      shadowColor: secondaryColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MainBorderRadius()),
                      ),
                      child: ListTile(
                        title: Text(
                          '${index + 1}: ${provider.documentsName[index]}',
                          style: BodySmall().copyWith(color: secondaryColor()),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: PdfReaderIFrame(
                                base64String: provider.documentsList[index],
                              ));
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
  }
}
