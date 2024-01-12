import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/home/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/models/Meeting.dart';
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
        return ListView.builder(
          itemCount: dealDetailProvider.calender.length,
          itemBuilder: (context, index) {
            Meeting meeting = dealDetailProvider.calender[index];
            DateTime meetingDateTime;
            try {
              meetingDateTime =
                  DateFormat('EEEE, yyyy-MM-dd – kk:mm').parse(meeting.date);
            } catch (e) {
              // Handle the exception
              safePrint('Invalid date format: ${meeting.date}');
              return Container(); // Return an empty container
            }

            return Column(
              children: <Widget>[
                Text(
                  DateFormat('EEEE').format(meetingDateTime), // Weekday
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  DateFormat('d').format(meetingDateTime), // Date
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.access_time), // Clock icon
                    Text(
                      DateFormat('hh:mm a').format(meetingDateTime), // Time
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  meeting.link, // Meeting link
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
