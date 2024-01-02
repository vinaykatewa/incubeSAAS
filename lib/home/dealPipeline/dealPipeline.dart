// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/home/dealPipeline/openDeal.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/provider.dart';

import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

import './addDeal.dart';
import './reviewPending.dart';

class DealPipeline extends StatefulWidget {
  const DealPipeline({super.key});

  @override
  State<DealPipeline> createState() => _DealPipelineState();
}

class _DealPipelineState extends State<DealPipeline> {
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
        return ReviewPandingDeals();
      case 1:
        return OpenDeals();
      case 2:
        return DealManagementScreen();
      case 3:
        return DealManagementScreen();
      case 4:
        return CommunicationsScreen();
      case 5:
        return CommunicationsScreen();
      case 6:
        return CommunicationsScreen();
      case 7:
        return AddDeal();
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
              7,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper:
                        ReverseBorderRadiusClipper(radius: MainBorderRadius()),
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.01),
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
          const Divider(
            color: const Color.fromRGBO(245, 247, 244, 1),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          // add new deal button
          ClipPath(
            clipper: ReverseBorderRadiusClipper(radius: MainBorderRadius()),
            child: Container(
              margin: EdgeInsets.only(left: screenWidth * 0.01),
              width: screenWidth * 0.15,
              decoration: BoxDecoration(
                  color: widget.selectedIndex == 7
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
                    setState(() {
                      widget.onButtonTapped(7);
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    color: widget.selectedIndex == 7
                        ? Colors.black
                        : const Color.fromRGBO(245, 247, 244, 1),
                    size: screenWidth * 0.01,
                  ),
                  label: Text(
                    "Create a new deal",
                    style: LabelMedium().copyWith(
                      color: widget.selectedIndex == 7
                          ? Colors.black
                          : const Color.fromRGBO(245, 247, 244, 1),
                    ),
                  ),
                ),
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
        return 'Review pending';
      case 1:
        return 'Open deals';
      case 2:
        return 'Presenting';
      case 3:
        return 'In due diligence';
      case 4:
        return 'closing';
      case 5:
        return 'Closed';
      case 6:
        return 'Rejected';
      default:
        return '';
    }
  }
}

class DealManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    final awsFunctions = AwsIncube();
    return Center(
      child: Column(
        children: [
          Text('Deal Management Screen'),
          ElevatedButton(
              onPressed: () async {
                // safePrint('this is the users email :' + _incubeProvider.email);
                // safePrint('this is the organizationid userName :' +
                //     _incubeProvider.userName);
                // safePrint('this is the users uid:' + _incubeProvider.userId);
                // safePrint('this is the organization Name :' +
                //     _incubeProvider.organizationName);
                // safePrint('this is the organizationid :' +
                //     _incubeProvider.organizationId);
                // safePrint('this is the admin id :' + _incubeProvider.adminId);

                // await awsFunctions.dealProcessing(
                //     "cf34947c-32cd-4bec-8311-2391d2203b9a",
                //     "open deals",
                //     "460d2e9a-a972-46b5-ad80-f07fe9072918");
              },
              child: Text('give deal'))
        ],
      ),
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
