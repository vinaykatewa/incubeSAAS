import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        return Container(); // Return a default screen or an empty container
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
        color: secondaryColor(),
        // gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color.fromRGBO(22, 43, 89, 1),
        //       Color.fromRGBO(66, 50, 121, 0.8),
        //       Color.fromRGBO(14, 58, 105, 1),
        //     ]),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(MainBorderRadius()),
          topRight: Radius.circular(MainBorderRadius()),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.014,
              ),
              Text(
                'Incube',
                style: GoogleFonts.bodoniModa(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              5,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper:
                        ReverseBorderRadiusClipper(radius: MainBorderRadius()),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: screenWidth * 0.01,
                      ),
                      width: screenWidth * 0.15,
                      decoration: BoxDecoration(
                          color: widget.selectedIndex == index
                              ? tertiaryColor1()
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MainBorderRadius()),
                            bottomLeft: Radius.circular(MainBorderRadius()),
                          )),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () {
                            widget.onButtonTapped(index);
                          },
                          icon: FaIcon(
                            _getNavigationIcons(index),
                            color: widget.selectedIndex == index
                                ? Colors.black
                                : const Color.fromRGBO(245, 247, 244, 1),
                            size: screenWidth * 0.01,
                          ),
                          label: Text(
                            _getNavigationText(index),
                            style: LabelMedium().copyWith(
                              color: widget.selectedIndex == index
                                  ? Colors.black
                                  : const Color.fromRGBO(245, 247, 244, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ],
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
    return Container(
      color: tertiaryColor1(),
      child: Center(
        child: Text('Deal Management Screen'),
      ),
    );
  }
}

class InvestmentTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: tertiaryColor1(),
      child: Center(
        child: Text('Investment Tracking Screen'),
      ),
    );
  }
}

class PortfolioAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: tertiaryColor1(),
      child: Center(
        child: Text('Portfolio Analytics Screen'),
      ),
    );
  }
}

class CommunicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: tertiaryColor1(),
      child: Center(
        child: Text('Communications Screen'),
      ),
    );
  }
}

class ReverseBorderRadiusClipper extends CustomClipper<Path> {
  // Define the radius of the reverse border
  final double radius;

  ReverseBorderRadiusClipper({this.radius = 20.0});

  @override
  Path getClip(Size size) {
    // Create a path object
    Path path = Path();

    // Move to the top left corner
    path.moveTo(0, 0);

    // Draw a line to the top right corner
    path.lineTo(size.width, 0);

    // Draw a curve to the bottom right corner with reverse border radius
    path.quadraticBezierTo(
        size.width - radius, size.height / 2, size.width, size.height);

    // Draw a line to the bottom left corner
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    // Return the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Return true if the clipper needs to be updated
    return true;
  }
}
