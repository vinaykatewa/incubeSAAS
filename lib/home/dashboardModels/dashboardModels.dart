import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incube/home/charts/barChart.dart';
import 'package:incube/home/dashboardProvider.dart';
import 'package:incube/home/dealDetailsmodels.dart';
import 'package:incube/themes.dart/blueShades.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:provider/provider.dart';

class DashBoardModels {
  final double screenHeight;
  final double screenWidth;

  DashBoardModels({required this.screenHeight, required this.screenWidth});

  Widget fillerContainer() {
    return Container(
      height: 400 * 0.001271 * screenHeight,
      width: 637 * 0.000651 * screenWidth,
      color: Colors.amber,
    );
  }

  Widget BarChart() {
    Widget BarChartContainer(BarModel barChart) {
      Widget cardHeader() {
        return SizedBox(
          height: 48 * 0.001271 * screenHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 48 * 0.001271 * screenHeight,
                width: 437 * 0.000651 * screenWidth,
                child: Column(
                  children: [
                    Text(
                      barChart.title,
                      style: textLgSemibold(0.000651 * screenWidth)
                          .copyWith(color: greyColor900()),
                    ),
                    Text(
                      barChart.description,
                      style: textSmRegular(0.000651 * screenWidth)
                          .copyWith(color: greyColor600()),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40 * 0.001271 * screenHeight,
                  width: 136 * 0.000651 * screenWidth,
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
                      Text(
                        'View full report',
                        style: textSmSemibold(0.000651 * screenWidth)
                            .copyWith(color: greyColor700()),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: 20 * 0.001271 * screenHeight,
                    width: 20 * 0.000651 * screenWidth,
                    child: SvgPicture.asset('assets/threeDots.svg')),
              ),
            ],
          ),
        );
      }

      Widget cardContent() {
        return Container(
          height: 311 * 0.001271 * screenHeight,
          width: 673 * 0.000651 * screenWidth,
          padding: EdgeInsets.only(
            top: 24 * 0.001271 * screenHeight,
            bottom: 24 * 0.001271 * screenHeight,
            // left: 24 * 0.000651 * screenWidth,
            // right: 24 * 0.000651 * screenWidth
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: blueColor100())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // width: 190 * 0.000651 * screenWidth,
                height: 20 * 0.001271 * screenHeight,
                child: Transform.rotate(
                  angle: -90 * pi / 180,
                  child: Text(
                    barChart.yName,
                    style: textXsMedium(0.000651 * screenWidth)
                        .copyWith(color: greyColor600()),
                  ),
                ),
              ),
              SizedBox(
                width: 550 * 0.000651 * screenWidth,
                height: 263 * 0.001271 * screenHeight,
                child: MyBarChart(
                  barGroups: List.generate(
                    barChart.xAxis.length,
                    (index) => BarChartGroupData(
                      x: barChart.xAxis[index],
                      barRods: [
                        BarChartRodData(
                          y: barChart.yAxis[index],
                          colors: [
                            const Color(0xFF2970FF),
                            const Color(0xFFEAECF0)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }

      return Container(
        // width: 673 * 0.000651 * screenWidth,
        height: 400 * 0.001271 * screenHeight,
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(
                color: greyColor200(), width: 1 * 0.000651 * screenWidth),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [cardHeader(), cardContent()],
        ),
      );
    }

    return Consumer<DashboardProvider>(
      builder: (context, _detailsProvider, child) {
        return BarChartContainer(_detailsProvider.barChartList[0]);
      },
    );
  }

  Widget AssignedDealS() {
    Widget assignDealContainer(CompanyModel comp) {
      return SizedBox(
        width: 360 * 0.000651 * screenWidth,
        child: Column(
          children: [
            Divider(
              color: greyColor200(),
            ),
            SizedBox(
              height: 16 * 0.001271 * screenHeight,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24 * 0.000651 * screenWidth,
                  ),
                  SizedBox(
                      height: 32 * 0.001271 * screenHeight,
                      width: 32 * 0.000651 * screenWidth,
                      child: SvgPicture.asset('assets/shopifyIcon.svg')),
                  SizedBox(
                    width: 12 * 0.000651 * screenWidth,
                  ),
                  Text(
                    comp.name,
                    style: textSmRegular(0.000651 * screenWidth)
                        .copyWith(color: greyColor600()),
                  ),
                  SizedBox(
                    width: 81 * 0.000651 * screenWidth,
                    // height: 72 * 0.001271 * screenHeight,
                    child: Text(
                      'View',
                      style: textSmSemibold(0.000651 * screenWidth)
                          .copyWith(color: blueColor700()),
                    ),
                  ),
                  SizedBox(
                    width: 90 * 0.000651 * screenWidth,
                    // height: 72 * 0.001271 * screenHeight,
                    child: Text(
                      '\$${comp.Raising}M',
                      style: textSmRegular(0.000651 * screenWidth)
                          .copyWith(color: greyColor600()),
                    ),
                  ),
                  SizedBox(
                    width: 24 * 0.000651 * screenWidth,
                  ),
                ]),
            SizedBox(
              height: 16 * 0.001271 * screenHeight,
            ),
            Divider(
              color: greyColor200(),
            ),
          ],
        ),
      );
    }

    return Consumer<DashboardProvider>(
        builder: (context, _dashboardProvider, child) {
      return Container(
        height: 382 * 0.001271 * screenHeight,
        padding: EdgeInsets.only(
            top: 16 * 0.001271 * screenHeight,
            // bottom: 16 * 0.001271 * screenHeight,
            left: 12 * 0.000651 * screenWidth,
            right: 12 * 0.000651 * screenWidth),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(
                color: greyColor100(), width: 1 * 0.000651 * screenWidth),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 356 * 0.000651 * screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assigned deals',
                    style: textLgBold(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                  Icon(
                    Icons.list,
                    color: greyColor400(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20 * 0.001271 * screenHeight,
            ),
            Container(
              height: 190 * 0.001271 * screenHeight,
              width: 336 * 0.000651 * screenWidth,
              child: ListView(
                children: _dashboardProvider.company.map((tab) {
                  return assignDealContainer(tab);
                }).toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Widget CalenderContainer(CalenderModel cal) {
      return SizedBox(
        width: 360 * 0.000651 * screenWidth,
        child: Column(
          children: [
            Divider(
              color: greyColor200(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 48 * 0.001271 * screenHeight,
                      width: 48 * 0.000651 * screenWidth,
                      child: Image.asset('assets/calendarAvatar.png')),
                  SizedBox(
                    width: 12 * 0.000651 * screenWidth,
                  ),
                  SizedBox(
                    // height: 48 * 0.001271 * screenHeight,
                    width: 276 * 0.000651 * screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cal.title,
                          style: textSmMedium(0.000651 * screenWidth)
                              .copyWith(color: greyColor700()),
                        ),
                        SizedBox(
                          height: 8 * 0.001271 * screenHeight,
                        ),
                        Text(
                          cal.timings,
                          style: textXsSemibold(0.000651 * screenWidth)
                              .copyWith(color: greyColor600()),
                        ),
                        Text(
                          cal.description,
                          style: textSmRegular(0.000651 * screenWidth)
                              .copyWith(color: greyColor600()),
                        ),
                      ],
                    ),
                  )
                ]),
          ],
        ),
      );
    }

    return Consumer<DashboardProvider>(
      builder: (context, _detailsProvider, child) {
        return Container(
          height: 382 * 0.001271 * screenHeight,
          padding: EdgeInsets.only(
              top: 16 * 0.001271 * screenHeight,
              // bottom: 16 * 0.001271 * screenHeight,
              left: 12 * 0.000651 * screenWidth,
              right: 12 * 0.000651 * screenWidth),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(
                  color: greyColor100(), width: 1 * 0.000651 * screenWidth),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 356 * 0.000651 * screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming activities',
                      style: textLgBold(0.000651 * screenWidth)
                          .copyWith(color: greyColor900()),
                    ),
                    Icon(
                      Icons.list,
                      color: greyColor400(),
                    )
                  ],
                ),
              ),
              Container(
                height: 190 * 0.001271 * screenHeight,
                width: 336 * 0.000651 * screenWidth,
                child: ListView(
                  children: _detailsProvider.calender.map((tab) {
                    return CalenderContainer(tab);
                  }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
