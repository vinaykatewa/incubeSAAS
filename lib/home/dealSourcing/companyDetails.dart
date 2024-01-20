import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incube/uiThemes.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({super.key});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: tertiaryColor1(),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://media.assettype.com/afkgaming%2F2022-02%2Fd13ddc2f-4aa5-4f40-a8fd-b4b1333002ae%2FUntitled_design__73___1_.jpg?compress=true&dpr=1&format=webp&w=1200',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: tertiaryColor1(),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(MainBorderRadius()),
                        ),
                        child: Text('DACBY TECHNOLOGIES PRIVATE LIMITED',
                            style: displaySmall().copyWith(
                                color: const Color.fromRGBO(
                                    30, 30, 30, 0.800000011920929))),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: tertiaryColor1(),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.rectangleAd,
                                color: Color.fromRGBO(
                                    30, 30, 30, 0.800000011920929),
                                size: 24,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 20, 5),
                                child: Text(' Kanpur, Uttar Pradesh, India',
                                    style: HeadlineSmall().copyWith(
                                        color: const Color.fromRGBO(
                                            30, 30, 30, 0.800000011920929))),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: // Generated code for this Card Widget...
                            Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: tertiaryColor1(),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                            child: Text('About',
                                style: TitleLarge().copyWith(
                                    color: const Color.fromRGBO(
                                        30, 30, 30, 0.800000011920929))),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: tertiaryColor1(),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                            child: Text(
                              'Dacby is an app-based intelligent digital e-commerce platform for gamers.',
                              style: BodyMedium().copyWith(
                                  color: const Color.fromRGBO(
                                      30, 30, 30, 0.800000011920929)),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: tertiaryColor1(),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.monetization_on,
                                      color: Color.fromRGBO(
                                          30, 30, 30, 0.800000011920929),
                                      size: 24,
                                    ),
                                    Text(
                                      'Series A',
                                      style: LabelMedium().copyWith(
                                          color: const Color.fromRGBO(
                                              30, 30, 30, 0.800000011920929)),
                                    ),
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.blinds,
                                    color: Color.fromRGBO(
                                        30, 30, 30, 0.800000011920929),
                                    size: 24,
                                  ),
                                  Text('Toys and Games',
                                      style: LabelMedium().copyWith(
                                          color: const Color.fromRGBO(
                                              30, 30, 30, 0.800000011920929))),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.store,
                                      color: Color.fromRGBO(
                                          30, 30, 30, 0.800000011920929),
                                      size: 24,
                                    ),
                                    Text('Virtual Games',
                                        style: LabelMedium().copyWith(
                                            color: const Color.fromRGBO(30, 30,
                                                30, 0.800000011920929))),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.stairs,
                                      color: Color.fromRGBO(
                                          30, 30, 30, 0.800000011920929),
                                      size: 24,
                                    ),
                                    Text(' EarlyTraction',
                                        style: LabelMedium().copyWith(
                                            color: const Color.fromRGBO(30, 30,
                                                30, 0.800000011920929))),
                                  ]),
                            ],
                          ),
                        ))
                  ],
                )),
          ],
        ));
  }
}
