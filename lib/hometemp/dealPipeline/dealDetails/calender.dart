import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/hometemp/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/models/Meeting.dart';
import 'package:incube/uiThemes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DealDetailsProvider>(
      builder: (context, dealDetailProvider, child) {
        return Card(
          elevation: 5.0,
          color: tertiaryColor2(),
          shadowColor: secondaryColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MainBorderRadius()),
          ),
          child: dealDetailProvider.calender.isEmpty
              ? const Text('Now meeting is scheduled yet')
              : ListView.builder(
                  itemCount: dealDetailProvider.calender.length,
                  itemBuilder: (context, index) {
                    Meeting meeting = dealDetailProvider.calender[index];
                    DateTime meetingDateTime;
                    try {
                      meetingDateTime = DateFormat('EEEE, yyyy-MM-dd – kk:mm')
                          .parse(meeting.date);
                    } catch (e) {
                      // Handle the exception
                      safePrint('Invalid date format: ${meeting.date}');
                      return Container(); // Return an empty container
                    }

                    return Card(
                      elevation: 5.0,
                      color: tertiaryColor1(),
                      shadowColor: secondaryColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MainBorderRadius()),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  DateFormat('EEEE')
                                      .format(meetingDateTime), // Weekday
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  DateFormat('d')
                                      .format(meetingDateTime), // Date
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: VerticalDivider(
                              color: secondaryColor(),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.access_time), // Clock icon
                                    Text(
                                      DateFormat('hh:mm a')
                                          .format(meetingDateTime), // Time
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Text(
                                  meeting.link, // Meeting link
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
