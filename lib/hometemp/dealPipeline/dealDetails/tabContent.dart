import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';
import 'dealDetailsProvider.dart';

class TabContentModel {
  final String title;
  final String content;

  TabContentModel({required this.title, required this.content});
}

class TabViewModel extends StatefulWidget {
  final TabContentModel tabContentModel;
  final int tabIndex;
  final int fieldIndex;
  const TabViewModel(
      {Key? key,
      required this.tabContentModel,
      required this.tabIndex,
      required this.fieldIndex})
      : super(key: key);
  @override
  State<TabViewModel> createState() => _TabViewModelState();
}

class _TabViewModelState extends State<TabViewModel> {
  TextEditingController tabHeaderController = TextEditingController();
  TextEditingController tabBodyController = TextEditingController();
  @override
  void initState() {
    super.initState();
    tabHeaderController.text = widget.tabContentModel.title;
    tabBodyController.text = widget.tabContentModel.content;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return SizedBox(
          width: screenWidth * 0.3,
          child: Card(
            elevation: 5.0,
            color: tertiaryColor2(),
            shadowColor: secondaryColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MainBorderRadius()),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: screenWidth * 0.05,
                    padding: EdgeInsets.only(left: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: tertiaryColor1(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MainBorderRadius()),
                        bottomLeft: Radius.circular(MainBorderRadius()),
                      ),
                    ),
                    child: TextField(
                      controller: tabHeaderController,
                      onChanged: (value) {
                        _detailsProvider.tabContent[widget.tabIndex]
                                [widget.fieldIndex] =
                            _detailsProvider.tabContent[widget.tabIndex]
                                    [widget.fieldIndex]
                                .copyWith(tabContentHeader: value);
                      },
                      style:
                          BodySmall().copyWith(color: const Color(0x7c1e1e1e)),
                      maxLines: null,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
                //content body
                Expanded(
                  flex: 4,
                  child: Container(
                    width: screenWidth * 0.25,
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.01,
                      right: screenWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: tertiaryColor1(),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MainBorderRadius()),
                        bottomRight: Radius.circular(MainBorderRadius()),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: tabBodyController,
                            onChanged: (value) {
                              _detailsProvider.tabContent[widget.tabIndex]
                                      [widget.fieldIndex] =
                                  _detailsProvider.tabContent[widget.tabIndex]
                                          [widget.fieldIndex]
                                      .copyWith(tabContentBody: value);
                            },
                            style: BodySmall()
                                .copyWith(color: const Color(0x7c1e1e1e)),
                            maxLines: null,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              // final url =
                              //     Uri.parse("http://localhost:5000/prompt");
                              // final response = await http
                              //     .post(url, body: {'key': 'api prompt'});
                              // safePrint('Response status: ${response.statusCode}');
                              // safePrint('Response body: ${response.body}');
                            },
                            icon: const Icon(
                              Icons.generating_tokens_outlined,
                              color: Color(0x7c1e1e1e),
                            )),
                        IconButton(
                            onPressed: () async {
                              _detailsProvider.updateFieldHeader(
                                tabIndex: widget.tabIndex,
                                fieldIndex: widget.fieldIndex,
                                header: tabHeaderController.text,
                              );
                              _detailsProvider.updateFieldBody(
                                  tabIndex: widget.tabIndex,
                                  fieldIndex: widget.fieldIndex,
                                  body: tabBodyController.text);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Color(0x7c1e1e1e),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
