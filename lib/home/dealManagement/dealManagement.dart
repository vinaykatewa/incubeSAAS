import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incube/uiThemes.dart';

class DealManagement extends StatefulWidget {
  const DealManagement({super.key});

  @override
  State<DealManagement> createState() => _DealManagementState();
}

class _DealManagementState extends State<DealManagement> {
  int selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigation(
            selectedIndex: selctedIndex,
            onButtonTapped: (index) {
              setState(() {
                selctedIndex = index;
              });
            },
          ),
          Expanded(child: _buildScreen(selctedIndex)),
        ],
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return PortfolioAnalyticsScreen();
      case 1:
        return DealManagementScreen();
      case 2:
        return InvestmentTrackingScreen();
      case 3:
        return PortfolioAnalyticsScreen();
      case 4:
        return CommunicationsScreen();
      default:
        return Container();
    }
  }
}

class SideNavigation extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onButtonTapped;

  const SideNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onButtonTapped,
  }) : super(key: key);

  @override
  State<SideNavigation> createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: screenWidth * 0.15,
      padding:
          EdgeInsets.only(left: screenWidth * 0.007, top: screenHeight * 0.04),
      margin: EdgeInsets.only(top: screenHeight * 0.002),
      decoration: BoxDecoration(
        color: Color.fromRGBO(54, 36, 101, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(MainBorderRadius()),
          topRight: Radius.circular(MainBorderRadius()),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          5,
          (index) => Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  widget.onButtonTapped(index);
                },
                icon: FaIcon(
                  _getNavigationIcons(index),
                  color: widget.selectedIndex == index
                      ? primaryColor2()
                      : const Color.fromRGBO(245, 247, 244, 0.8),
                  size: screenWidth * 0.01,
                ),
                label: Text(
                  _getNavigationText(index),
                  style: LabelSmall().copyWith(
                    color: widget.selectedIndex == index
                        ? primaryColor2()
                        : const Color.fromRGBO(245, 247, 244, 0.8),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getNavigationIcons(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.user;
      case 1:
        return FontAwesomeIcons.barsProgress;
      case 2:
        return FontAwesomeIcons.plus;
      case 3:
        return FontAwesomeIcons.arrowUpFromGroundWater;
      case 4:
        return FontAwesomeIcons.usps;
      case 5:
        return FontAwesomeIcons.peopleRoof;
      default:
        return FontAwesomeIcons.listCheck;
    }
  }

  String _getNavigationText(int index) {
    switch (index) {
      case 0:
        return 'Profile';
      case 1:
        return 'Deal piepline';
      case 2:
        return 'Add investment';
      case 3:
        return 'Add funds';
      case 4:
        return 'Initiate capital call';
      case 5:
        return 'Manage investor';
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

class CommunicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Communications Screen'),
    );
  }
}
