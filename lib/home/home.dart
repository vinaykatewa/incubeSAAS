import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:incube/firebase/firebase.dart';
// import 'package:incube/route.dart';
import './dashboard/dashboard.dart';
import '../uiThemes.dart';
import './communications/communications.dart';
import './dealManagement/dealManagement.dart';
import './investmentTracking/investmentTracking.dart';
import './portfolioAnalytics/portfolioAnalytics.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavigationBar(
            selectedButtonIndex: selectedButtonIndex,
            onButtonTapped: (index) {
              setState(() {
                selectedButtonIndex = index;
              });
            },
          ),
          Expanded(
            child: _buildScreen(selectedButtonIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const Dashboard();
      case 1:
        return const DealManagement();
      case 2:
        return const InvestmentTracking();
      case 3:
        return const PortfolioAnalytics();
      case 4:
        return const Communications();
      default:
        return Container();
    }
  }
}

class NavigationBar extends StatefulWidget {
  final Function(int) onButtonTapped;
  final int selectedButtonIndex;

  const NavigationBar(
      {Key? key,
      required this.selectedButtonIndex,
      required this.onButtonTapped})
      : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: EdgeInsets.only(
            left: screenWidth * 0.01, right: screenWidth * 0.01),
        width: double.infinity,
        height: screenHeight * 0.05,
        color: textColor(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Incube',
              style: GoogleFonts.bodoniModa(
                color: const Color.fromRGBO(202, 131, 70, 1),
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              child: Row(
                children: List.generate(
                  5,
                  (index) => TextButton(
                    onPressed: () {
                      widget.onButtonTapped(index);
                    },
                    child: Text(
                      _getButtonText(index),
                      style: LabelMedium().copyWith(
                        color: widget.selectedButtonIndex == index
                            ? primaryColor2()
                            : const Color.fromRGBO(245, 247, 244, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              //perform click function here
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.user,
                    color: const Color.fromRGBO(245, 247, 244, 1),
                    size: screenWidth * 0.01,
                  ),
                  SizedBox(
                    width: screenWidth * 0.007,
                  ),
                  Text(
                    'Log out',
                    style: LabelSmall().copyWith(
                      color: const Color.fromRGBO(245, 247, 244, 1),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getButtonText(int index) {
    switch (index) {
      case 0:
        return 'DashBoard';
      case 1:
        return 'Deal Management';
      case 2:
        return 'Investment Tracking';
      case 3:
        return 'Portfolio Analytics';
      case 4:
        return 'Communications';
      default:
        return '';
    }
  }
}

class DealManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Deal Management Screen'),
    );
  }
}

class InvestmentTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Investment Tracking Screen'),
    );
  }
}

class PortfolioAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Portfolio Analytics Screen'),
    );
  }
}
