import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:incube/uiThemes.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final TextEditingController _eventController = TextEditingController();
  final CollectionReference _eventsCollection =
      FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tertiaryColor1(),
      body: StreamBuilder(
        stream: _eventsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final events = snapshot.data?.docs ?? [];

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: screenHeight * 0.05,
              crossAxisSpacing: screenHeight * 0.05,
              childAspectRatio: (screenWidth) / (screenHeight),
            ),
            padding: EdgeInsets.only(
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                top: screenWidth * 0.02),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: tertiaryColor2(),
                  borderRadius:
                      BorderRadius.all(Radius.circular(MainBorderRadius())),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.01, top: screenHeight * 0.001),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['Event_Name'],
                          style: TitleLarge().copyWith(color: textColor()),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        Text(
                          event['Event_Timing'],
                          style: BodyMedium().copyWith(color: textColor()),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          event['Event_Details'],
                          style: BodySmall().copyWith(
                            color: const Color.fromRGBO(51, 27, 94, 0.7),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor1(),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(borderRadiusAuth()),
                            ),
                            elevation: 2,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenWidth * 0.006,
                                bottom: screenWidth * 0.006),
                            child: Text(
                              'Enroll',
                              style: LabelMedium().copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(context),
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: primaryColor1(),
      ),
    );
  }

  Future<void> _showAddEventDialog(BuildContext context) async {
    String eventTitle = '';
    String eventDate = '';
    String eventUrl = '';
    String eventDetails = '';

    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController urlController = TextEditingController();
    TextEditingController detailsController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Event Name'),
                onChanged: (value) {
                  eventTitle = value;
                },
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Event Timing'),
                onChanged: (value) {
                  eventDate = value;
                },
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: urlController,
                decoration: const InputDecoration(labelText: 'Event url'),
                onChanged: (value) {
                  eventUrl = value;
                },
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: detailsController,
                decoration: const InputDecoration(labelText: 'Event Details'),
                onChanged: (value) {
                  eventDetails = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (eventTitle.isNotEmpty) {
                  await _addEventToFirestore(
                      eventTitle, eventDate, eventUrl, eventDetails);
                  titleController.clear();
                  detailsController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addEventToFirestore(
      String title, String eventDate, String eventUrl, String des) async {
    try {
      await _eventsCollection.add({
        'Event_Name': title,
        'Event_Timing': eventDate,
        'Event_url': eventUrl,
        'Event_Details': des,
      });
    } catch (e) {
      print('Error adding event to Firestore: $e');
    }
  }
}
