import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/home/dealPipeline.dart';
import 'package:incube/home/portfolio.dart';
import 'package:incube/home/userSheets/userSheets.dart';
import 'package:incube/home/userSheets/userSheetsProvider.dart';
import 'package:incube/models/usersPersonalSheets.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  var screenWidth;
  var screenHeight;
  final apiCalls = ApiCalls();
  final List<Widget> dashBoardChildren = [
    Container(
      child: Image.network(
        'https://media.giphy.com/media/L3nzug1PBLZo2SAZb4/giphy.gif',
      ),
    ),
    const DealSourcing(),
    Container(
      child: Image.network(
        'https://media.giphy.com/media/L3nzug1PBLZo2SAZb4/giphy.gif',
      ),
    ),
    const Portfolio(),
    const UserSheets(),
    Container(
      child: Image.network(
        'https://media.giphy.com/media/L3nzug1PBLZo2SAZb4/giphy.gif',
      ),
    ),
    Container(
      child: Image.network(
        'https://media.giphy.com/media/L3nzug1PBLZo2SAZb4/giphy.gif',
      ),
    ),
    Container(
      child: Image.network(
        'https://media.giphy.com/media/L3nzug1PBLZo2SAZb4/giphy.gif',
      ),
    ),
    Container(
      child: Image.network(
        'https://media.giphy.com/media/L3nzug1PBLZo2SAZb4/giphy.gif',
      ),
    ),
  ];

  Future<void> settingUserSheets() async {
    UserSheetsProvider _dealDetailsProvider =
        Provider.of<UserSheetsProvider>(context, listen: false);
    List<Folder> wholeList = [];
    for (usersPersonalSheets userSheet in _dealDetailsProvider.userSheets) {
      List<List<Map<String, dynamic>>> sheets = [];
      for (String id in userSheet.googleSheet) {
        List<Map<String, dynamic>> temp = await apiCalls.sheetList(id);
        sheets.add(temp);
      }
      wholeList.add(Folder(folderName: userSheet.folderName, sheets: sheets));
    }
    _dealDetailsProvider.folders = wholeList;
    _dealDetailsProvider.doneLoading();
  }

  @override
  void initState() {
    super.initState();
    settingUserSheets();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            SizedBox(
                width: 312 * 0.000651 * screenWidth, child: navigationBar()),
            Expanded(
              flex: 9,
              child: dashBoardChildren[currentIndex],
            )
          ],
        ),
      ),
    );
  }

  Widget navigationBar() {
    return Container(
      padding: EdgeInsets.only(top: 32 * 0.001271 * screenHeight),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border(
              right: BorderSide(
                  color: greyColor200(), width: 1 * 0.000651 * screenWidth))),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 24 * 0.000651 * screenWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/incubelogo.png',
              ),
              SizedBox(width: 12 * 0.000651 * screenWidth),
              Text(
                'InCube',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Kadwa',
                    fontSize: 24 * 0.000651 * screenWidth,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24 * 0.001271 * screenHeight,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 16 * 0.000651 * screenWidth,
              right: 16 * 0.000651 * screenWidth),
          child: navigation(),
        ),
        SizedBox(
          height: screenHeight * 0.15,
        ),
        // SizedBox(
        //   height: screenHeight * 0.28,
        // ),
        Padding(
          padding: EdgeInsets.only(
              left: 16 * 0.000651 * screenWidth,
              right: 16 * 0.000651 * screenWidth,
              top: 20 * 0.001271 * screenHeight),
          child: footer(),
        ),
      ]),
    );
  }

  Widget navigation() {
    return Column(
      children: [
        navigationContainer('assets/dashboard.svg', 'Dashboard', 0),
        navigationContainer('assets/dealpipelineIcon.svg', 'Deal pipeline', 1),
        navigationContainer('assets/dealSourcingIcon.svg', 'Deal sourcing', 2),
        navigationContainer(
            'assets/portfolioIcon.svg', 'Portfolio analytics', 3),
        navigationContainer('assets/sheetsIcon.svg', 'User sheets', 4),
      ],
    );
  }

  Widget navigationContainer(String path, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 40 * 0.001271 * screenHeight,
        padding: EdgeInsets.only(
            top: 8 * 0.001271 * screenHeight,
            bottom: 8 * 0.001271 * screenHeight),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color:
              currentIndex == index ? greyColor100() : const Color(0xFFFFFFFF),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 12 * 0.000651 * screenWidth,
              ),
              SizedBox(
                  height: 24 * 0.001271 * screenHeight,
                  width: 24 * 0.000651 * screenWidth,
                  child: SvgPicture.asset(path)),
              SizedBox(
                width: 8 * 0.000651 * screenWidth,
              ),
              Text(
                name,
                style: textMdSemibold(0.000651 * screenWidth)
                    .copyWith(color: greyColor700()),
              )
            ]),
      ),
    );
  }

  Widget footer() {
    return SizedBox(
      height: 348 * 0.001271 * screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          navigationContainer('assets/whatsNewIcon.svg', 'What\'s new', 7),
          navigationContainer('assets/settingsIcon.svg', 'Settings', 8),
          SizedBox(
            height: 14 * 0.001271 * screenHeight,
          ),
          Container(
            width: 280 * 0.000651 * screenWidth,
            height: 120 * 0.001271 * screenHeight,
            padding: EdgeInsets.only(
                left: 14 * 0.000651 * screenWidth,
                right: 14 * 0.000651 * screenWidth,
                top: 10 * 0.001271 * screenHeight,
                bottom: 10 * 0.001271 * screenHeight),
            child: Column(children: [
              SizedBox(
                  width: 216 * 0.000651 * screenWidth,
                  child: Center(
                    child: Text(
                      'Want to add companies latest round?',
                      style: textSmMedium(0.000651 * screenWidth)
                          .copyWith(color: const Color(0xFF475467)),
                      textAlign: TextAlign.center,
                    ),
                  )),
              SizedBox(
                height: 8 * 0.001271 * screenHeight,
              ),
              GestureDetector(
                onTap: () {
                  // Handle tap
                },
                child: Container(
                  width: 219 * 0.000651 * screenWidth,
                  height: 44 * 0.001271 * screenHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF585858),
                        Color(0xFF000000),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16 * 0.000651 * screenWidth,
                        right: 16 * 0.000651 * screenWidth,
                        top: 10 * 0.001271 * screenHeight,
                        bottom: 10 * 0.001271 * screenHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24 * 0.001271 * screenHeight,
                          width: 24 * 0.000651 * screenWidth,
                          child: Image.asset('assets/addInvestmentIcon.png'),
                        ),
                        SizedBox(
                          width: 6 * 0.000651 * screenWidth,
                        ),
                        Text(
                          'Add investment',
                          style: textSmBold(0.000651 * screenWidth)
                              .copyWith(color: const Color(0xFFFCFCFD)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 14 * 0.001271 * screenHeight,
          ),
          GestureDetector(
            onTap: () {
              print('Container tapped!');
            },
            child: Container(
              width: 280 * 0.000651 * screenWidth,
              height: 64 * 0.001271 * screenHeight,
              padding: EdgeInsets.only(
                  left: 8 * 0.000651 * screenWidth,
                  right: 32 * 0.000651 * screenWidth,
                  top: 24 * 0.001271 * screenHeight,
                  bottom: 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 1.0 * 0.000651 * screenWidth,
                      color: const Color(0xFFEAECF0)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: 40 * 0.000651 * screenWidth,
                      height: 40 * 0.001271 * screenHeight,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: const Color(0xFF000000),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xFFF9FAFB),
                          child: Text(
                            'N',
                            style: textMdSemibold(0.000651 * screenWidth)
                                .copyWith(color: const Color(0xFF344054)),
                          ),
                        ),
                      )),
                  SizedBox(width: 12 * 0.000651 * screenWidth),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vinay Katewa',
                        style: textSmSemibold(0.000651 * screenWidth)
                            .copyWith(color: const Color(0xFF344054)),
                      ),
                      SizedBox(
                        height: 18 * 0.001271 * screenHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Log out',
                              style: textSmRegular(0.000651 * screenWidth)
                                  .copyWith(color: const Color(0xFF475467)),
                            ),
                            SizedBox(width: 12 * 0.000651 * screenWidth),
                            SizedBox(
                                height: 16 * 0.001271 * screenHeight,
                                width: 16 * 0.000651 * screenWidth,
                                child: Image.asset('assets/logOutIcon.png')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
