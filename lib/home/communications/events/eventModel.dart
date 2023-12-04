import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String eventName;
  final String eventProvider;
  final String eventTag;
  final String eventParticipants;
  final String eventFee;
  final DateTime eventTiming;
  final String eventImage;
  final String eventLocation;
  final bool isEventOnline;

  EventModel({
    required this.eventName,
    required this.eventProvider,
    required this.eventTag,
    required this.eventParticipants,
    required this.eventFee,
    required this.eventTiming,
    required this.eventImage,
    required this.eventLocation,
    required this.isEventOnline,
  });

  factory EventModel.fromDocument(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return EventModel(
      eventName: data['Event_Name'],
      eventProvider: data['Event_Provider'],
      eventTag: data['Event_Tag'],
      eventParticipants: data['Event_Participants'],
      eventFee: data['Event_Fee'],
      eventTiming: (data['Event_Timing'] as Timestamp).toDate(),
      eventImage: data['Event_image'],
      eventLocation: data['Event_Location'],
      isEventOnline: data['is_Event_Online'],
    );
  }
  factory EventModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return EventModel(
      eventName: data['Event_Name'],
      eventProvider: data['Event_Provider'],
      eventTag: data['Event_Tag'],
      eventParticipants: data['Event_Participants'],
      eventFee: data['Event_Fee'],
      eventTiming: (data['Event_Timing'] as Timestamp).toDate(),
      eventImage: data['Event_image'],
      eventLocation: data['Event_Location'],
      isEventOnline: data['is_Event_Online'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Event_Name': eventName,
      'Event_Provider': eventProvider,
      'Event_Tag': eventTag,
      'Event_Participants': eventParticipants,
      'Event_Fee': eventFee,
      'Event_Timing': eventTiming,
      'Event_image': eventImage,
      'Event_Location': eventLocation,
      'is_Event_Online': isEventOnline,
    };
  }
}
