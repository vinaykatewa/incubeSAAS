import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incube/uiThemes.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:incube/authentication/userImage.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'eventModel.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final TextEditingController _eventController = TextEditingController();
  final CollectionReference _eventsCollection =
      FirebaseFirestore.instance.collection('events');
  bool isOnline = true;

  String _formatDaysRemaining(DateTime eventDate) {
    final currentDate = DateTime.now();
    final difference = eventDate.difference(currentDate).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference < 0) {
      return 'Event passed';
    } else {
      return '$difference days left';
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US', null);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.01;
    String _formatDateTime(DateTime dateTime) {
      final formatter = DateFormat.yMMMMd('en_US').add_jm();
      return formatter.format(dateTime);
    }

    return Scaffold(
      backgroundColor: tertiaryColor1(),
      body: StreamBuilder(
        stream: _eventsCollection.orderBy('Event_Timing').snapshots(),
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

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = EventModel.fromFirestore(events[index]);
                    //outer container
                    return Container(
                      margin: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          bottom: screenWidth * 0.02,
                          top: screenWidth * 0.02,
                          right: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: secondaryColor(),
                      ),
                      constraints: const BoxConstraints(
                        minHeight: 200,
                      ),
                      //inner container
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth * 0.003, bottom: 0),
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.01, top: screenWidth * 0.01),
                        decoration: BoxDecoration(
                          color: tertiaryColor2(),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.09,
                                      height: screenWidth * 0.09,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        image: DecorationImage(
                                          image: NetworkImage(event.eventImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.01,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.eventName,
                                          style: TitleMedium().copyWith(
                                            color: textColor(),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenWidth * 0.007,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: screenWidth * 0.005,
                                                  bottom: screenWidth * 0.005,
                                                  left: screenWidth * 0.01,
                                                  right: screenWidth * 0.01),
                                              decoration: BoxDecoration(
                                                  color: secondaryColor(),
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          MainBorderRadius()))),
                                              child: Text(
                                                _formatDaysRemaining(
                                                    event.eventTiming),
                                                style: BodySmall().copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.1,
                                            ),
                                            event.isEventOnline
                                                ? Container(
                                                    child: Row(
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .globe,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          size: iconSize,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.002,
                                                        ),
                                                        Text(
                                                          'Online',
                                                          style: BodySmall()
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    child: Row(
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .locationDot,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          size: iconSize,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.002,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                          ],
                                        ),
                                        SizedBox(
                                          height: screenWidth * 0.014,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //row 1
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('Event fee:'),
                                                SizedBox(
                                                  width: screenWidth * 0.003,
                                                ),
                                                FaIcon(
                                                  FontAwesomeIcons.dollarSign,
                                                  size: screenWidth * 0.01,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.002,
                                                ),
                                                Text(
                                                  event.eventFee,
                                                  style: BodySmall().copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.09,
                                            ),

                                            //row 2
                                            Row(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        event.eventParticipants,
                                                        style: BodySmall()
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenWidth * 0.003,
                                                      ),
                                                      Text(
                                                        'participants',
                                                        style: BodySmall()
                                                            .copyWith(
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.end,
                                        //   children: [
                                        //     Column(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.center,
                                        //       children: [
                                        //         Container(
                                        //           padding: EdgeInsets.only(
                                        //               top: screenWidth * 0.005,
                                        //               bottom:
                                        //                   screenWidth * 0.005,
                                        //               left: screenWidth * 0.01,
                                        //               right:
                                        //                   screenWidth * 0.01),
                                        //           decoration: BoxDecoration(
                                        //               color: secondaryColor(),
                                        //               borderRadius: BorderRadius
                                        //                   .all(Radius.circular(
                                        //                       MainBorderRadius()))),
                                        //           child: Text(
                                        //             _formatDaysRemaining(
                                        //                 event['Event_Timing']
                                        //                     .toDate()),
                                        //             style: BodySmall().copyWith(
                                        //               color: Colors.white,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           children: [
                                        //             Text('Event fee:'),
                                        //             SizedBox(
                                        //               width:
                                        //                   screenWidth * 0.003,
                                        //             ),
                                        //             FaIcon(
                                        //               FontAwesomeIcons
                                        //                   .dollarSign,
                                        //               size: screenWidth * 0.01,
                                        //               color: Colors.black
                                        //                   .withOpacity(0.7),
                                        //             ),
                                        //             SizedBox(
                                        //               width:
                                        //                   screenWidth * 0.002,
                                        //             ),
                                        //             Text(
                                        //               event['Event_Fee'],
                                        //               style:
                                        //                   BodySmall().copyWith(
                                        //                 color: Colors.black,
                                        //                 fontWeight:
                                        //                     FontWeight.w600,
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     Column(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.end,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.end,
                                        //       children: [
                                        //         event['is_Event_Online']
                                        //             ? Container(
                                        //                 child: Row(
                                        //                   children: [
                                        //                     FaIcon(
                                        //                       FontAwesomeIcons
                                        //                           .globe,
                                        //                       color: Colors
                                        //                           .black
                                        //                           .withOpacity(
                                        //                               0.7),
                                        //                       size: iconSize,
                                        //                     ),
                                        //                     SizedBox(
                                        //                       width:
                                        //                           screenWidth *
                                        //                               0.002,
                                        //                     ),
                                        //                     Text(
                                        //                       'Online',
                                        //                       style: BodySmall()
                                        //                           .copyWith(
                                        //                               color: Colors
                                        //                                   .black),
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //               )
                                        //             : Container(
                                        //                 child: Row(
                                        //                   children: [
                                        //                     FaIcon(
                                        //                       FontAwesomeIcons
                                        //                           .locationDot,
                                        //                       color: Colors
                                        //                           .black
                                        //                           .withOpacity(
                                        //                               0.7),
                                        //                       size: iconSize,
                                        //                     ),
                                        //                     SizedBox(
                                        //                       width:
                                        //                           screenWidth *
                                        //                               0.002,
                                        //                     ),
                                        //                     // Text(
                                        //                     //   'Online',
                                        //                     //   style: BodySmall().copyWith(
                                        //                     //       color: Colors.black),
                                        //                     // ),
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //         Row(
                                        //           children: [
                                        //             Text(
                                        //               event[
                                        //                   'Event_Participants'],
                                        //               style: BodySmall()
                                        //                   .copyWith(
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .w600,
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //             SizedBox(
                                        //               width:
                                        //                   screenWidth * 0.003,
                                        //             ),
                                        //             Text(
                                        //               'participants',
                                        //               style: BodySmall()
                                        //                   .copyWith(
                                        //                       color:
                                        //                           Colors.black),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.2,
                                    )
                                  ],
                                ),
                                //middle part of row ends here

                                // second and last part Column
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.grey[700]!,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.solidFlag,
                                        color: Colors.black.withOpacity(0.7),
                                        size: iconSize,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),

                                      //event provider name
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    MainBorderRadius())),
                                            border: Border.all(
                                              color: secondaryColor(),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Text(
                                            event.eventProvider,
                                            style: TextStyle(
                                                color: secondaryColor()),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenWidth * 0.007,
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.solidCalendar,
                                        color: Colors.black.withOpacity(0.7),
                                        size: iconSize,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),
                                      Text(
                                        '${_formatDateTime(event.eventTiming)}',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenWidth * 0.007,
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.tags,
                                        color: Colors.black.withOpacity(0.7),
                                        size: iconSize,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),
                                      Text(
                                        event.eventTag,
                                        style: TextStyle(
                                          color: secondaryColor(),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: screenWidth * 0.008, bottom: screenHeight * 0.008),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  FloatingActionButton(
                    onPressed: () => _showAddEventDialog(context),
                    child: Icon(Icons.add),
                    backgroundColor: secondaryColor(),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showAddEventDialog(BuildContext context) async {
    String eventTitle = '';
    String eventProvider = '';
    String eventFee = '';
    String eventParticipants = '';
    String eventTag = '';
    DateTime eventDate = DateTime.now(); // Changed to DateTime
    String eventLocation = '';
    Uint8List? selectedImage;
    bool isOnline = true;

    FocusNode titleFocusNode = FocusNode();
    FocusNode eventProviderFocusNode = FocusNode();
    // Add more FocusNodes for other text fields

    void onImagePicked(Uint8List? image) {
      setState(() {
        selectedImage = image;
      });
    }

    TextEditingController titleController = TextEditingController();
    TextEditingController eventProviderController = TextEditingController();
    TextEditingController eventFeeController = TextEditingController();
    TextEditingController eventParticipantsController = TextEditingController();
    TextEditingController eventTagController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController eventLocationController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: secondaryColor(),
              title: Text(
                'Add Event',
                style: BodyMedium().copyWith(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Event Name',
                      labelStyle: BodySmall()
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: BodySmall().copyWith(color: Colors.white),
                    onChanged: (value) {
                      eventTitle = value;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: eventProviderController,
                    decoration: InputDecoration(
                      labelText: 'Event Organizer',
                      labelStyle: BodySmall()
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: BodySmall().copyWith(color: Colors.white),
                    onChanged: (value) {
                      eventProvider = value;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: eventFeeController,
                    decoration: InputDecoration(
                      labelText: 'eventFee',
                      labelStyle: BodySmall()
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: BodySmall().copyWith(color: Colors.white),
                    onChanged: (value) {
                      eventFee = value;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: eventParticipantsController,
                    decoration: InputDecoration(
                      labelText: 'No of participants',
                      labelStyle: BodySmall()
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: BodySmall().copyWith(color: Colors.white),
                    onChanged: (value) {
                      eventParticipants = value;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: eventTagController,
                    decoration: InputDecoration(
                      labelText: 'Tag for the event',
                      labelStyle: BodySmall()
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: BodySmall().copyWith(color: Colors.white),
                    onChanged: (value) {
                      eventTag = value;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: eventDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          eventDate = DateTime(
                            pickedDate.year,
                            pickedDate.month,
                            pickedDate.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );

                          dateController.text =
                              DateFormat('yyyy-MM-dd HH:mm').format(eventDate);
                        }
                      }
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'Event Timing',
                          labelStyle: BodySmall()
                              .copyWith(color: Colors.white.withOpacity(0.8)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: BodySmall().copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Switch
                  Row(
                    children: [
                      Text(
                        'Online',
                        style: BodySmall().copyWith(color: Colors.white),
                      ),
                      Switch(
                        activeColor: Colors.white,
                        value: isOnline,
                        onChanged: (value) {
                          setState(() {
                            isOnline = value;
                          });
                        },
                      ),
                    ],
                  ),
                  isOnline
                      ? SizedBox()
                      : TextField(
                          controller: eventLocationController,
                          decoration: InputDecoration(
                            labelText: 'Location',
                            labelStyle: BodySmall()
                                .copyWith(color: Colors.white.withOpacity(0.8)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: BodySmall().copyWith(color: Colors.white),
                          onChanged: (value) {
                            eventLocation = value;
                          },
                        ),
                  SizedBox(height: 8.0),
                  UserImage(onPickedImage: onImagePicked),
                  SizedBox(height: 8.0),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel',
                      style: BodySmall().copyWith(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () async {
                    if (eventTitle.isNotEmpty) {
                      await _addEventToFirestore(
                          eventTitle,
                          eventDate,
                          eventLocation,
                          selectedImage!,
                          isOnline,
                          eventFee,
                          eventParticipants,
                          eventTag,
                          eventProvider);
                      titleController.clear();
                      dateController.clear();
                      eventLocationController.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add',
                      style: BodySmall().copyWith(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _addEventToFirestore(
      String title,
      DateTime eventDate,
      String location,
      Uint8List image,
      bool isOnline,
      String eventFee,
      String eventParticipants,
      String eventTag,
      String eventProvider) async {
    try {
      final Reference ref = FirebaseStorage.instance
          .ref()
          .child('Images')
          .child('${Uuid().v4()}.jpg');
      await ref.putData(image);
      final imageUrl = await ref.getDownloadURL();
      print('Image uploaded successfully');
      await _eventsCollection.add(EventModel(
        eventName: title,
        eventProvider: eventProvider,
        eventTag: eventTag,
        eventParticipants: eventParticipants,
        eventFee: eventFee,
        eventTiming: eventDate,
        eventImage: imageUrl,
        eventLocation: location,
        isEventOnline: isOnline,
      ).toMap());
    } catch (e) {
      print('Error adding event to Firestore: $e');
    }
  }
}
