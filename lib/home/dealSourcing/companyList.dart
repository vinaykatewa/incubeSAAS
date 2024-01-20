import 'package:flutter/material.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Consumer<IncubeProvider>(
      builder: (context, provider, child) {
        var data = provider.sheetData;

        return Container(
          padding: EdgeInsets.only(
              right: screenWidth * 0.04,
              top: screenWidth * 0.01,
              bottom: screenHeight * 0.01),
          color: tertiaryColor2(),
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisExtent: screenHeight * 0.3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.02),
                child: Card(
                  elevation: 5.0,
                  color: tertiaryColor1(),
                  shadowColor: secondaryColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MainBorderRadius()),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.007, bottom: screenWidth * 0.007),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.007,
                              right: screenWidth * 0.007),
                          child: Text(
                            '${data[index]["Name"]}',
                            style: LabelMedium().copyWith(
                              color: const Color.fromRGBO(
                                  30, 30, 30, 0.800000011920929),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${data[index]["City"]}, ',
                              style: LabelSmall().copyWith(
                                  color: const Color.fromRGBO(
                                          30, 30, 30, 0.800000011920929)
                                      .withOpacity(0.9)),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${data[index]["State"]}, ',
                              style: LabelSmall().copyWith(
                                  color: const Color.fromRGBO(
                                          30, 30, 30, 0.800000011920929)
                                      .withOpacity(0.9)),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${data[index]["Country"]}',
                              style: LabelSmall().copyWith(
                                  color: const Color.fromRGBO(
                                          30, 30, 30, 0.800000011920929)
                                      .withOpacity(0.9)),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Divider(
                          color: const Color.fromRGBO(
                                  30, 30, 30, 0.800000011920929)
                              .withOpacity(0.8),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.007,
                              right: screenWidth * 0.007),
                          child: Text(
                            '${data[index]["Description"]}',
                            style: BodySmall().copyWith(
                                color: const Color.fromRGBO(
                                        30, 30, 30, 0.800000011920929)
                                    .withOpacity(0.8)),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Text('Name: ${data[index]["Name"]}'),
                        // Text(
                        //     'Company Linkedin: ${data[index]["Company Linkedin"]}'),
                        // Text('Description: ${data[index]["Description"]}'),
                        // Text('Sector: ${data[index]["Sector"]}'),
                        // Text('Industry: ${data[index]["Industry"]}'),
                        // Text('Funding: ${data[index]["Funding"]}'),
                        // Text('Stage: ${data[index]["Stage"]}'),
                        // Text('City: ${data[index]["City"]}'),
                        // Text('State: ${data[index]["State"]}'),
                        // Text('Country: ${data[index]["Country"]}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
