import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incube/home/charts/barChart.dart';
import 'package:incube/home/dashboardModels/dashboardModels.dart';
import 'package:incube/home/dashboardProvider.dart';
import 'package:incube/home/dealDetailsmodels.dart';
import 'package:incube/themes.dart/blueShades.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var screenWidth;
  var screenHeight;

  void _onReorder(int oldIndex, int newIndex, List<Widget> targetList) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Widget item = targetList.removeAt(oldIndex);
      targetList.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
    final _dashboardModel =
        DashBoardModels(screenHeight: screenHeight, screenWidth: screenWidth);
    List<Widget> smallWidget = [
      Calendar(),
      _dashboardModel.AssignedDealS(),
      // _dashboardModel.Calender(),
    ];
    List<Widget> largeWidget = [
      _dashboardModel.fillerContainer(),
      _dashboardModel.fillerContainer(),
      _dashboardModel.fillerContainer(),
    ];

    return Container(
      padding: EdgeInsets.only(
          top: 48 * 0.001271 * screenHeight,
          // bottom: 96 * 0.001271 * screenHeight,
          left: 32 * 0.000651 * screenWidth,
          right: 32 * 0.000651 * screenWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          SizedBox(
            height: 24 * 0.001271 * screenHeight,
          ),
          Row(
            children: [
              SizedBox(
                width: 24 * 0.000651 * screenWidth,
              ),
              SizedBox(
                width: 550 * 0.000651 * screenWidth,
                height: 500 * 0.001271 * screenHeight,
                child: ReorderableList(items: smallWidget),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget header() {
    Widget headerButtons() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40 * 0.001271 * screenHeight,
              width: 92 * 0.000651 * screenWidth,
              padding: EdgeInsets.only(
                  top: 10 * 0.001271 * screenHeight,
                  bottom: 10 * 0.001271 * screenHeight,
                  left: 14 * 0.000651 * screenWidth,
                  right: 14 * 0.000651 * screenWidth),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: blueColor100())),
              child: Row(
                children: [
                  Text(
                    'Add new',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: blueColor600()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 12 * 0.000651 * screenWidth,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40 * 0.001271 * screenHeight,
              width: 129 * 0.000651 * screenWidth,
              padding: EdgeInsets.only(
                  top: 10 * 0.001271 * screenHeight,
                  bottom: 10 * 0.001271 * screenHeight,
                  left: 14 * 0.000651 * screenWidth,
                  right: 14 * 0.000651 * screenWidth),
              decoration: BoxDecoration(
                  border: Border.all(color: greyColor300()),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  SizedBox(
                      height: 20 * 0.001271 * screenHeight,
                      width: 20 * 0.000651 * screenWidth,
                      child: SvgPicture.asset('assets/customizeIcon.svg')),
                  SizedBox(
                    width: 4 * 0.000651 * screenWidth,
                  ),
                  Text(
                    'Customize',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor700()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 12 * 0.000651 * screenWidth,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40 * 0.001271 * screenHeight,
              width: 101 * 0.000651 * screenWidth,
              padding: EdgeInsets.only(
                  top: 10 * 0.001271 * screenHeight,
                  bottom: 10 * 0.001271 * screenHeight,
                  left: 14 * 0.000651 * screenWidth,
                  right: 14 * 0.000651 * screenWidth),
              decoration: BoxDecoration(
                  border: Border.all(color: greyColor300()),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  SizedBox(
                      height: 20 * 0.001271 * screenHeight,
                      width: 20 * 0.000651 * screenWidth,
                      child: SvgPicture.asset('assets/saveIcon.svg')),
                  SizedBox(
                    width: 4 * 0.000651 * screenWidth,
                  ),
                  Text(
                    'Save',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor700()),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      height: 40 * 0.001271 * screenHeight,
      // width: 328 * 0.000651 * screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome back, Vinay',
            style: displaySmSemibold(0.000651 * screenWidth)
                .copyWith(color: greyColor900()),
          ),
          headerButtons(),
        ],
      ),
    );
  }
}

class ReorderableList extends StatefulWidget {
  final List<Widget> items;

  ReorderableList({required this.items});

  @override
  _ReorderableListState createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableList> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Widget item = widget.items.removeAt(oldIndex);
      widget.items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: _onReorder,
      children: widget.items.asMap().entries.map((entry) {
        int index = entry.key;
        Widget item = entry.value;
        return ReorderableDragStartListener(
          index: index,
          child: ListTile(
            key: Key('list-$index'),
            title: item,
          ),
        );
      }).toList(),
    );
  }
}
