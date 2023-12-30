import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class ReviewPandingDeals extends StatefulWidget {
  const ReviewPandingDeals({super.key});

  @override
  State<ReviewPandingDeals> createState() => _ReviewPandingDealsState();
}

class _ReviewPandingDealsState extends State<ReviewPandingDeals> {
  List<Deals?> _dealList = [];
  final _awsIncube = AwsIncube();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchDeals(context);
    });
  }

  Future<void> fetchDeals(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    // safePrint('fetchDeals method is running');
    // final IncubeProvider _incubeProvider =
    //     Provider.of<IncubeProvider>(context, listen: false);
    // try {
    //   safePrint('fetchDeals is trying to get the data');

    //   safePrint('this is the admin id of the organization: ' +
    //       _incubeProvider.adminId);
    //   final _organization =
    //       await _awsIncube.getOrganizationByAdminId(_incubeProvider.adminId);
    //   setState(() {
    //     _dealList = _organization!.org_deals!
    //         .where((element) => element.status == "review pending")
    //         .toList();
    //   });
    // } on ApiException catch (e) {
    //   safePrint('Query failed: $e');
    //   safePrint('queryListItems method is failed');
    // }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (!isLoading && _dealList.isEmpty) {
      return const Center(
        child: Text("No deal is present at this time"),
      );
    }

    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _dealList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
                margin: EdgeInsets.all(13),
                child: SizedBox(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.25,
                  child: Column(children: [
                    Text(_dealList[index]!.company_name),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text(_dealList[index]!.company_description),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text("seeking: \$" + _dealList[index]!.seeking),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text('View Application')),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('View Deal')),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    const Divider(),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Make Commitment'))
                  ]),
                )),
          );
        },
      ),
    );
  }
}
