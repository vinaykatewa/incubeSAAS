import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incube/home/communications/events/eventsUi.dart';
import 'package:incube/uiThemes.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:incube/authentication/userImage.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:incube/models/Events.dart';
import 'dart:html' as html;

import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:aws_common/web.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  State<EventsWidget> createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  final TextEditingController _eventController = TextEditingController();
  bool isOnline = true;
  late StreamController<List<Events?>> _eventsStreamController;

  // String _formatDaysRemaining(DateTime eventDate) {
  //   final currentDate = DateTime.now();
  //   final difference = eventDate.difference(currentDate).inDays;

  //   if (difference == 0) {
  //     return 'Today';
  //   } else if (difference == 1) {
  //     return 'Tomorrow';
  //   } else if (difference < 0) {
  //     return 'Event passed';
  //   } else {
  //     return '$difference days left';
  //   }
  // }

  List<Events?> _eventsList = [];
  @override
  void initState() {
    super.initState();
    _eventsStreamController = StreamController<List<Events?>>();
    queryListItems();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US', null);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.01;
    // String _formatDateTime(DateTime dateTime) {
    //   final formatter = DateFormat.yMMMMd('en_US').add_jm();
    //   return formatter.format(dateTime);
    // }

    return Scaffold(
      backgroundColor: tertiaryColor1(),
      body: StreamBuilder(
        stream: _eventsStreamController.stream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _eventsList.length,
                  itemBuilder: (context, index) {
                    final _event = _eventsList[index]!;
                    //outer container
                    return EventsUi(
                      event: _event,
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
    DateTime eventDate = DateTime.now();
    String eventLocation = '';
    String selectedImage = '';
    String imageUrl = '';
    bool isOnline = true;

    Future<void> uploadImage() async {
      // Select a file from the device
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withData: false,
        // Ensure to get file stream for better performance
        withReadStream: true,
        allowedExtensions: ['jpg', 'png', 'gif'],
      );

      if (result == null) {
        safePrint('No file selected');
        return;
      }

      // Upload file with its filename as the key
      final platformFile = result.files.single;
      try {
        final result = await Amplify.Storage.uploadFile(
          localFile: AWSFile.fromStream(
            platformFile.readStream!,
            size: platformFile.size,
          ),
          key: DateTime.now().toIso8601String(),
          onProgress: (progress) {
            safePrint('Fraction completed: ${progress.fractionCompleted}');
          },
        ).result;
        safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
        setState(() {
          selectedImage = result.uploadedItem.key;
        });
        // result.uploadedItem.key;
      } on StorageException catch (e) {
        safePrint('Error uploading file: $e');
        rethrow;
      }
    }

    Future<String> getImageUrl(String key) async {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: const StorageGetUrlOptions(
          pluginOptions: S3GetUrlPluginOptions(
            validateObjectExistence: true,
            expiresIn: Duration(days: 1000),
          ),
        ),
      ).result;
      return result.url.toString();
    }

    Future<void> storingImage() async {
      if (selectedImage == '') {
        safePrint('sotre image is returning null');
        return;
      }
      final result = await getImageUrl(selectedImage);
      setState(() {
        imageUrl = result;
      });
      safePrint('here is your download url');
      safePrint(imageUrl);
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
                  // UserImage(onPickedImage: onImagePicked),
                  ElevatedButton(
                      onPressed: () {
                        uploadImage();
                      },
                      child: Text('select')),
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
                    await storingImage().whenComplete(() async {
                      safePrint('storing image is done');
                      safePrint(
                          'this is image url that we have stored' + imageUrl);
                      await _addEventToFirestore(
                              eventTitle,
                              eventDate,
                              eventLocation,
                              imageUrl,
                              isOnline,
                              eventFee,
                              eventParticipants,
                              eventTag,
                              eventProvider)
                          .whenComplete(() async {
                        await queryListItems();
                      });
                      titleController.clear();
                      dateController.clear();
                      eventLocationController.clear();
                      Navigator.of(context).pop();
                    });
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
      String image,
      bool isOnline,
      String eventFee,
      String eventParticipants,
      String eventTag,
      String eventProvider) async {
    safePrint('_addEvent is running');
    try {
      safePrint("this is title: " + title);
      safePrint("this is title: " + eventDate.toString());
      safePrint("this is title: " + location);
      final eventModel = Events(
          eventName: title,
          eventProvider: eventProvider,
          eventTag: eventTag,
          eventParticipants: eventParticipants,
          eventFee: eventFee,
          eventTiming: eventDate.toString(),
          eventImage: image,
          eventLocation: location,
          isEventOnline: isOnline);
      final request = ModelMutations.create(eventModel);
      final response = await Amplify.API.mutate(request: request).response;

      final createdTodo = response.data;
      if (createdTodo == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result: ${createdTodo.eventName}');
      safePrint('Mutation result: ${createdTodo.eventProvider}');
      safePrint('Mutation result: ${createdTodo.eventTag}');
      safePrint('Mutation result: ${createdTodo.eventParticipants}');
      safePrint('Mutation result: ${createdTodo.eventFee}');
      safePrint('Mutation result: ${createdTodo.eventTiming}');
      safePrint('Mutation result: ${createdTodo.eventImage}');
      safePrint('Mutation result: ${createdTodo.eventLocation}');
      safePrint('Mutation result: ${createdTodo.isEventOnline}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<void> queryListItems() async {
    safePrint('queryListItems method is running');
    try {
      safePrint('queryListItems is trying to get the data');
      final request = ModelQueries.list(Events.classType);
      final response =
          await Amplify.API.query(request: request).response.whenComplete(() {
        safePrint('Amplify api call is completed');
      });
      setState(() {
        safePrint('setState of queryListItems is running');
        _eventsList.addAll(response.data!.items);
      });
      safePrint('length of the list: ${_eventsList.length}');
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      safePrint('queryListItems method is failed');
    }
  }
}
