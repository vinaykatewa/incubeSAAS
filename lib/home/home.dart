import 'package:flutter/material.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  var screenWidth;
  var screenHeight;
  final List<Widget> dashBoardChildren = [
    Container(
      color: Colors.amber,
    )
  ];
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
            Expanded(flex: 2, child: navigationBar()),
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
      color: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.only(top: 32),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/incubelogo.png',
              ),
              const SizedBox(width: 12),
              const Text(
                'InCube',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Kadwa',
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: navigation(),
        ),
        SizedBox(
          height: screenHeight * 0.2,
        ),
        // SizedBox(
        //   height: screenHeight * 0.28,
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: footer(),
        ),
      ]),
    );
  }

  Widget navigation() {
    return Column(
      children: [
        navigationContainer('assets/dashboardIcon.png', 'Dashboard', 0),
        navigationContainer('assets/dealpipelineIcon.png', 'Deal pipeline', 1),
        navigationContainer('assets/dealSourcingIcon.png', 'Deal sourcing', 2),
        navigationContainer(
            'assets/portfolioIcon.png', 'Portfolio analytics', 3),
        // navigationContainer(
        //     'assets/communicationIcon.png', 'Communications', 4),
        // navigationContainer('assets/eventsIcon.png', 'Events', 5),
        // navigationContainer('assets/chatformIcon.png', 'Chatform', 6),
      ],
    );
  }

  Widget navigationContainer(String path, String name, int index) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: currentIndex == index ? greyColor100() : const Color(0xFFFFFFFF),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 12,
            ),
            SizedBox(height: 24, width: 24, child: Image.asset(path)),
            SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: textMdSemibold().copyWith(color: const Color(0xFF344053)),
            )
          ]),
    );
  }

  Widget footer() {
    return SizedBox(
      height: 348,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          navigationContainer('assets/whatsNewIcon.png', 'What\'s new', 7),
          navigationContainer('assets/settingsIcon.png', 'Settings', 8),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: 280,
            height: 120,
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Column(children: [
              SizedBox(
                  width: 216,
                  child: Center(
                    child: Text(
                      'Want to add companies latest round?',
                      style: textSmMedium()
                          .copyWith(color: const Color(0xFF475467)),
                      textAlign: TextAlign.center,
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  // Handle tap
                },
                child: Container(
                  width: 219,
                  height: 44,
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
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset('assets/addInvestmentIcon.png'),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Add investment',
                          style: textSmBold()
                              .copyWith(color: const Color(0xFFFCFCFD)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {
              print('Container tapped!');
            },
            child: Container(
              width: 280,
              height: 64,
              padding:
                  const EdgeInsets.only(left: 8, right: 32, top: 24, bottom: 0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: const Color(0xFFEAECF0)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: const Color(0xFF000000),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xFFF9FAFB),
                          child: Text(
                            'N',
                            style: textMdSemibold()
                                .copyWith(color: const Color(0xFF344054)),
                          ),
                        ),
                      )),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vinay Katewa',
                        style: textSmSemibold()
                            .copyWith(color: const Color(0xFF344054)),
                      ),
                      SizedBox(
                        height: 18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Log out',
                              style: textSmRegular()
                                  .copyWith(color: const Color(0xFF475467)),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                                height: 16,
                                width: 16,
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
