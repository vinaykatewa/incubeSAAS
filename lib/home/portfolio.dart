import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incube/home/portfolioProvider.dart';
import 'package:incube/hometemp/portfolioAnalytics/usersheets/userSheetProvider.dart';
import 'package:incube/themes.dart/blueShades.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  var screenWidth;
  var screenHeight;
  final int totalFunds = 4800000;
  final int fundUtilized = 2600000;
  final int fundRemaining = 2200000;
  final int Roi = 5000000;
  final int fundUtilization = 18880;
  List<PortfolioCompany?> listShow = [];
  int currentIndex = 0;
  int currentPage = 0;
  final _pageController = PageController();
  final _itemsPerPage = 6;
  var _pages = 1;

  String formatNumber(int num) {
    if (num >= 1000000000) {
      return (num / 1000000000).toStringAsFixed(1) + 'B';
    } else if (num >= 1000000) {
      return (num / 1000000).toStringAsFixed(1) + 'M';
    } else if (num >= 1000) {
      return (num / 1000).toStringAsFixed(1) + 'K';
    } else {
      return num.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    PortfolioProvider portfolioProvider =
        Provider.of<PortfolioProvider>(context, listen: false);
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
      listShow = portfolioProvider.portfolioCompanyList;
    });
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 48 * 0.001271 * screenHeight,
            // bottom: 96 * 0.001271 * screenHeight,
            left: 32 * 0.000651 * screenWidth,
            right: 32 * 0.000651 * screenWidth),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          header(),
          SizedBox(
            height: 20 * 0.001271 * screenHeight,
          ),
          Divider(color: greyColor200()),
          SizedBox(
            height: 24 * 0.001271 * screenHeight,
          ),
          body(),
          SizedBox(
            height: 24 * 0.001271 * screenHeight,
          ),
          footer()
        ]),
      ),
    );
  }

  Widget header() {
    Widget pagetitle() {
      return Container(
        height: 62 * 0.001271 * screenHeight,
        width: 1057 * 0.000651 * screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Portfolio analysis',
              style: displaySmSemibold(0.000651 * screenWidth)
                  .copyWith(color: greyColor900()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4 * 0.001271 * screenHeight,
            ),
            Text(
              'Check how funds are utilized',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    Widget btn() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 36 * 0.001271 * screenHeight,
          width: 102 * 0.000651 * screenWidth,
          padding: EdgeInsets.only(
              top: 10 * 0.001271 * screenHeight,
              bottom: 10 * 0.001271 * screenHeight,
              left: 14 * 0.000651 * screenWidth,
              right: 14 * 0.000651 * screenWidth),
          decoration: BoxDecoration(
              color: blueColor600(),
              border: Border.all(
                  color: blueColor600(), width: 1 * 0.000651 * screenWidth),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            'Add funds',
            style: textSmSemibold(0.000651 * screenWidth)
                .copyWith(color: const Color(0xFFFFFFFF)),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: 20 * 0.001271 * screenHeight,
        // ),
        pagetitle(),
        btn()
      ],
    );
  }

  Widget body() {
    Widget firstChild() {
      Widget fundsUtilized() {
        return SizedBox(
          height: 74 * 0.001271 * screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Funds utilization',
                style: textSmMedium(0.000651 * screenWidth)
                    .copyWith(color: greyColor600()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$',
                    style: textXlMedium(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                  SizedBox(
                    width: 2 * 0.000651 * screenWidth,
                  ),
                  Text(
                    fundUtilization.toString(),
                    style: displayMdSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                  SizedBox(
                    width: 8 * 0.000651 * screenWidth,
                  ),
                  SizedBox(
                    width: 56 * 0.000651 * screenWidth,
                    height: 20 * 0.001271 * screenHeight,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 20 * 0.001271 * screenHeight,
                            width: 20 * 0.000651 * screenWidth,
                            child: SvgPicture.asset('assets/trendupIcon.svg')),
                        SizedBox(
                          width: 4 * 0.000651 * screenWidth,
                        ),
                        Text(
                          '7.4%',
                          style: textSmMedium(0.000651 * screenWidth)
                              .copyWith(color: const Color(0xFF067647)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }

      return SizedBox(
        width: 219 * 0.000651 * screenWidth,
        height: 324 * 0.001271 * screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            fundsUtilized(),
            // Divider(),
            SizedBox(
              height: 10 * 0.001271 * screenHeight,
            ),
            Center(
              child: Text(
                'Portofolio health',
                style: textSmMedium(0.000651 * screenWidth)
                    .copyWith(color: greyColor600()),
              ),
            ),
            Speedometer(
              screenWidth: 0.000651 * screenWidth,
              screenHeight: 0.001271 * screenHeight,
            )
          ],
        ),
      );
    }

    Widget lastChild() {
      Widget matrixContainer(int i, String title, double growth) {
        return SizedBox(
          height: 74 * 0.001271 * screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textSmMedium(0.000651 * screenWidth)
                    .copyWith(color: greyColor600()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$',
                    style: textXlMedium(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                  SizedBox(
                    width: 2 * 0.000651 * screenWidth,
                  ),
                  Text(
                    formatNumber(i),
                    style: displayMdSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                  SizedBox(
                    width: 8 * 0.000651 * screenWidth,
                  ),
                  SizedBox(
                    width: 56 * 0.000651 * screenWidth,
                    height: 20 * 0.001271 * screenHeight,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 20 * 0.001271 * screenHeight,
                            width: 20 * 0.000651 * screenWidth,
                            child: SvgPicture.asset('assets/trendupIcon.svg')),
                        SizedBox(
                          width: 4 * 0.000651 * screenWidth,
                        ),
                        Text(
                          growth.toString(),
                          style: textSmMedium(0.000651 * screenWidth)
                              .copyWith(color: const Color(0xFF067647)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }

      return SizedBox(
        width: 160 * 0.000651 * screenWidth,
        height: 324 * 0.001271 * screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            matrixContainer(totalFunds, 'Total fund', 9.2),
            matrixContainer(fundUtilized, 'Fund utilized', 6.6),
            matrixContainer(fundRemaining, 'Funds remaining', 8.1),
            matrixContainer(Roi, 'ROI', 8.3)
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        firstChild(),
        SizedBox(
            height: 312 * 0.001271 * screenHeight,
            width: 560 * 0.000651 * screenWidth,
            child: SvgPicture.asset('assets/tempChart.svg')),
        lastChild()
      ],
    );
  }

  Widget footer() {
    Widget head() {
      return SizedBox(
        height: 40 * 0.001271 * screenHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Investment history',
              style: textLgSemibold(0.000651 * screenWidth)
                  .copyWith(color: greyColor900()),
            ),
            SizedBox(
              width: 240 * 0.000651 * screenWidth,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40 * 0.001271 * screenHeight,
                      width: 124 * 0.000651 * screenWidth,
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
                            'Download',
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
                      // width: 124 * 0.000651 * screenWidth,
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
                              // width: 99 * 0.000651 * screenWidth,
                              child: SvgPicture.asset('assets/filterIcon.svg')),
                          SizedBox(
                            width: 4 * 0.000651 * screenWidth,
                          ),
                          Text(
                            'Filters',
                            style: textSmSemibold(0.000651 * screenWidth)
                                .copyWith(color: greyColor700()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        head(),
        SizedBox(
          height: 24 * 0.001271 * screenHeight,
        ),
        table(context),
        tableFooter()
      ],
    );
  }

  Widget table(BuildContext context) {
    setState(() {
      _pages = (listShow.length / _itemsPerPage).ceil();
    });
    Widget Music() {
      return Container(
        width: 59 * 0.000651 * screenWidth,
        height: 22 * 0.001271 * screenHeight,
        padding: EdgeInsets.only(
            top: 2 * 0.001271 * screenHeight,
            bottom: 2 * 0.001271 * screenHeight,
            left: 6 * 0.000651 * screenWidth,
            right: 6 * 0.000651 * screenWidth),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: greyColor300())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 8 * 0.001271 * screenHeight,
                width: 8 * 0.000651 * screenWidth,
                child: SvgPicture.asset('assets/blueDot.svg')),
            SizedBox(
              width: 4 * 0.000651 * screenWidth,
            ),
            Text(
              'Music',
              style: textXsMedium(0.000651 * screenWidth)
                  .copyWith(color: greyColor700()),
            ),
          ],
        ),
      );
    }

    Widget CustomListTile(
        {required String name,
        required int raising,
        required String date,
        required String category,
        required String teamLeader}) {
      return SizedBox(
        child: Row(
          children: [
            SizedBox(
                height: 40 * 0.001271 * screenHeight,
                width: 40 * 0.000651 * screenWidth,
                child: SvgPicture.asset('assets/shopifyIcon.svg')),
            SizedBox(
              width: 12 * 0.000651 * screenWidth,
            ),
            Text(
              name,
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(
              width: 215 * 0.000651 * screenWidth,
            ),
            Text(
              '\$',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            Text(
              formatNumber(raising),
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(
              width: 215 * 0.000651 * screenWidth,
            ),
            category == 'Music' ? Music() : Music(),
            SizedBox(
              width: 215 * 0.000651 * screenWidth,
            ),
            SizedBox(
                height: 32 * 0.001271 * screenHeight,
                width: 32 * 0.000651 * screenWidth,
                child: SvgPicture.asset('assets/userImage.svg')),
            SizedBox(
              width: 12 * 0.000651 * screenWidth,
            ),
            Text(
              teamLeader,
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(
              width: 215 * 0.000651 * screenWidth,
            ),
            SizedBox(
                height: 20 * 0.001271 * screenHeight,
                width: 20 * 0.000651 * screenWidth,
                child: SvgPicture.asset('assets/editPenIcon.svg'))
          ],
        ),
      );
    }

    Widget CustomListHeader() {
      return SizedBox(
        child: Row(
          children: [
            Text(
              'Company',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(
              width: 250 * 0.000651 * screenWidth,
            ),
            Text(
              'Amount',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(
              width: 205 * 0.000651 * screenWidth,
            ),
            Text(
              'Startup category',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(
              width: 185 * 0.000651 * screenWidth,
            ),
            Text(
              'Assigned team',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 357 * 0.001271 * screenHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pages,
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
        itemBuilder: (context, pageIndex) {
          final start = pageIndex * _itemsPerPage;
          final end = min(start + _itemsPerPage, listShow.length);
          final pageItems = listShow.sublist(start, end);

          return ListView.builder(
              itemCount: pageItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    index == 0 ? CustomListHeader() : SizedBox(),
                    Divider(
                      color: greyColor200(),
                    ),
                    CustomListTile(
                        name: pageItems[index]!.name,
                        raising: pageItems[index]!.raising,
                        date: pageItems[index]!.date,
                        category: pageItems[index]!.category,
                        teamLeader: pageItems[index]!.teamLeader),
                  ],
                );
              });
        },
      ),
    );
  }

  Widget tableFooter() {
    return Container(
      height: 65 * 0.001271 * screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: currentPage > 0
                ? () {
                    _pageController.animateToPage(
                      currentPage - 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                : null,
            child: SizedBox(
              height: 15 * 0.001271 * screenHeight,
              width: 85 * 0.000651 * screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: greyColor600(),
                    size: 18 * 0.000651 * screenWidth,
                  ),
                  SizedBox(
                    width: 6 * 0.000651 * screenWidth,
                  ),
                  Text(
                    'Previous',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor600()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 298 * 0.000651 * screenWidth,
            child: Row(
              children: List<Widget>.generate(_pages, (index) {
                return pageNumber(index);
              }),
            ),
          ),
          GestureDetector(
            onTap: currentPage < _pages - 1
                ? () {
                    _pageController.animateToPage(
                      currentPage + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                : null,
            child: SizedBox(
              height: 15 * 0.001271 * screenHeight,
              width: 85 * 0.000651 * screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor600()),
                  ),
                  SizedBox(
                    width: 6 * 0.000651 * screenWidth,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: greyColor600(),
                    size: 18 * 0.000651 * screenWidth,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageNumber(int i) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          i,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 40 * 0.001271 * screenHeight,
        width: 40 * 0.000651 * screenWidth,
        // decoration: BoxDecoration(
        //   color: currentPage == i ? Colors.blue : Colors.grey,
        // ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color:
              currentPage == i ? greyColor100() : greyColor50().withOpacity(0),
        ),
        child: Text(
          '${i + 1}',
          style: textSmMedium(0.000651 * screenWidth).copyWith(
              color: currentIndex == i ? greyColor800() : greyColor600()),
        ),
        // Text(
        //   '$i',
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }
}

class Speedometer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const Speedometer(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 219 * screenWidth,
        height: 200 * screenHeight,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 150,
              showLabels: false,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 50,
                    color: const Color(0xFFD92D20),
                    startWidth: 10 * screenWidth,
                    endWidth: 10 * screenWidth),
                GaugeRange(
                    startValue: 50,
                    endValue: 100,
                    color: const Color(0xFFFDB022),
                    startWidth: 10 * screenWidth,
                    endWidth: 10 * screenWidth),
                GaugeRange(
                    startValue: 100,
                    endValue: 150,
                    color: const Color(0xFF054F31),
                    startWidth: 10 * screenWidth,
                    endWidth: 10 * screenWidth)
              ],
              pointers: const <GaugePointer>[
                NeedlePointer(value: 20)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text('20',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ]));
  }
}
