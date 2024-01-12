import 'package:flutter/material.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';
import 'dealDetailsProvider.dart';

class TabTitle extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final int tabIndex;
  const TabTitle(
      {Key? key,
      required this.title,
      required this.controller,
      required this.tabIndex})
      : super(key: key);
  @override
  State<TabTitle> createState() => _TabTitleState();
}

class _TabTitleState extends State<TabTitle> {
  TextEditingController titleHaderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleHaderController.text = "Title";
    widget.controller.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return SizedBox(
          width: screenWidth * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: secondaryColor(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MainBorderRadius()),
                      bottomLeft: Radius.circular(MainBorderRadius()),
                    ),
                  ),
                  child: TextField(
                      readOnly: true,
                      controller: titleHaderController,
                      style: BodySmall()
                          .copyWith(color: Colors.white.withOpacity(0.9)),
                      maxLines: null,
                      decoration:
                          const InputDecoration(border: InputBorder.none)),
                ),
              ),
              //content body
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.01,
                    right: screenWidth * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor(),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(MainBorderRadius()),
                      bottomRight: Radius.circular(MainBorderRadius()),
                    ),
                  ),
                  child: TextField(
                    controller: widget.controller,
                    onChanged: (value) {
                      _detailsProvider.tabTitles[widget.tabIndex] = value;
                    },
                    style: BodySmall()
                        .copyWith(color: Colors.white.withOpacity(0.9)),
                    maxLines: null,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
