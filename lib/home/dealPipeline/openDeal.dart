import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class OpenDeals extends StatefulWidget {
  const OpenDeals({super.key});

  @override
  State<OpenDeals> createState() => _OpenDealsState();
}

class _OpenDealsState extends State<OpenDeals> {
  List<Deals?> _dealList = [];
  final _awsIncube = AwsIncube();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchDeals(context);
    });
  }

  Future<void> fetchDeals(BuildContext context) async {
    safePrint('fetchDeals method is running');
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    try {
      safePrint('fetchDeals is trying to get the data');

      safePrint('this is the admin id of the organization: ' +
          _incubeProvider.adminId);
      final _organization =
          await _awsIncube.getOrganizationByAdminId(_incubeProvider.adminId);
      setState(() {
        _dealList = _organization!.org_deals!
            .where((element) => element.status == "open deals")
            .toList();
      });
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      safePrint('queryListItems method is failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    if (_dealList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
