import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';

class PortfolioProvider extends ChangeNotifier {
  List<PortfolioCompany?> _portfolioCompanyList = [
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
    PortfolioCompany(
        name: 'Spotify',
        raising: 2000000,
        date: 'Wed 1:00pm',
        category: 'Music',
        teamLeader: 'Vinay'),
  ];

  List<PortfolioCompany?> get portfolioCompanyList => _portfolioCompanyList;

  set setPortfolioCompanyList(List<PortfolioCompany?> temp) {
    _portfolioCompanyList = temp;
    notifyListeners();
  }
}

class PortfolioCompany {
  final String name;
  final int raising;
  final String date;
  final String category;
  final String teamLeader;

  PortfolioCompany(
      {required this.name,
      required this.raising,
      required this.date,
      required this.category,
      required this.teamLeader});
}

class MusicCategory extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  const MusicCategory(
      {super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 59 * screenWidth,
      height: 22 * screenHeight,
      padding: EdgeInsets.only(
          top: 2 * screenHeight,
          bottom: 2 * screenHeight,
          left: 6 * screenWidth,
          right: 6 * screenWidth),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: greyColor300())),
      child: Row(
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
}
