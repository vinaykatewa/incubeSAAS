/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Events type in your schema. */
class Events extends amplify_core.Model {
  static const classType = const _EventsModelType();
  final String id;
  final String? _eventName;
  final String? _eventProvider;
  final String? _eventTag;
  final String? _eventParticipants;
  final String? _eventFee;
  final String? _eventTiming;
  final String? _eventImage;
  final String? _eventLocation;
  final bool? _isEventOnline;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventsModelIdentifier get modelIdentifier {
      return EventsModelIdentifier(
        id: id
      );
  }
  
  String get eventName {
    try {
      return _eventName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventProvider {
    try {
      return _eventProvider!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventTag {
    try {
      return _eventTag!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventParticipants {
    try {
      return _eventParticipants!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventFee {
    try {
      return _eventFee!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventTiming {
    try {
      return _eventTiming!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventImage {
    try {
      return _eventImage!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get eventLocation {
    return _eventLocation;
  }
  
  bool get isEventOnline {
    try {
      return _isEventOnline!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Events._internal({required this.id, required eventName, required eventProvider, required eventTag, required eventParticipants, required eventFee, required eventTiming, required eventImage, eventLocation, required isEventOnline, createdAt, updatedAt}): _eventName = eventName, _eventProvider = eventProvider, _eventTag = eventTag, _eventParticipants = eventParticipants, _eventFee = eventFee, _eventTiming = eventTiming, _eventImage = eventImage, _eventLocation = eventLocation, _isEventOnline = isEventOnline, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Events({String? id, required String eventName, required String eventProvider, required String eventTag, required String eventParticipants, required String eventFee, required String eventTiming, required String eventImage, String? eventLocation, required bool isEventOnline}) {
    return Events._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      eventName: eventName,
      eventProvider: eventProvider,
      eventTag: eventTag,
      eventParticipants: eventParticipants,
      eventFee: eventFee,
      eventTiming: eventTiming,
      eventImage: eventImage,
      eventLocation: eventLocation,
      isEventOnline: isEventOnline);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Events &&
      id == other.id &&
      _eventName == other._eventName &&
      _eventProvider == other._eventProvider &&
      _eventTag == other._eventTag &&
      _eventParticipants == other._eventParticipants &&
      _eventFee == other._eventFee &&
      _eventTiming == other._eventTiming &&
      _eventImage == other._eventImage &&
      _eventLocation == other._eventLocation &&
      _isEventOnline == other._isEventOnline;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Events {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("eventName=" + "$_eventName" + ", ");
    buffer.write("eventProvider=" + "$_eventProvider" + ", ");
    buffer.write("eventTag=" + "$_eventTag" + ", ");
    buffer.write("eventParticipants=" + "$_eventParticipants" + ", ");
    buffer.write("eventFee=" + "$_eventFee" + ", ");
    buffer.write("eventTiming=" + "$_eventTiming" + ", ");
    buffer.write("eventImage=" + "$_eventImage" + ", ");
    buffer.write("eventLocation=" + "$_eventLocation" + ", ");
    buffer.write("isEventOnline=" + (_isEventOnline != null ? _isEventOnline!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Events copyWith({String? eventName, String? eventProvider, String? eventTag, String? eventParticipants, String? eventFee, String? eventTiming, String? eventImage, String? eventLocation, bool? isEventOnline}) {
    return Events._internal(
      id: id,
      eventName: eventName ?? this.eventName,
      eventProvider: eventProvider ?? this.eventProvider,
      eventTag: eventTag ?? this.eventTag,
      eventParticipants: eventParticipants ?? this.eventParticipants,
      eventFee: eventFee ?? this.eventFee,
      eventTiming: eventTiming ?? this.eventTiming,
      eventImage: eventImage ?? this.eventImage,
      eventLocation: eventLocation ?? this.eventLocation,
      isEventOnline: isEventOnline ?? this.isEventOnline);
  }
  
  Events copyWithModelFieldValues({
    ModelFieldValue<String>? eventName,
    ModelFieldValue<String>? eventProvider,
    ModelFieldValue<String>? eventTag,
    ModelFieldValue<String>? eventParticipants,
    ModelFieldValue<String>? eventFee,
    ModelFieldValue<String>? eventTiming,
    ModelFieldValue<String>? eventImage,
    ModelFieldValue<String?>? eventLocation,
    ModelFieldValue<bool>? isEventOnline
  }) {
    return Events._internal(
      id: id,
      eventName: eventName == null ? this.eventName : eventName.value,
      eventProvider: eventProvider == null ? this.eventProvider : eventProvider.value,
      eventTag: eventTag == null ? this.eventTag : eventTag.value,
      eventParticipants: eventParticipants == null ? this.eventParticipants : eventParticipants.value,
      eventFee: eventFee == null ? this.eventFee : eventFee.value,
      eventTiming: eventTiming == null ? this.eventTiming : eventTiming.value,
      eventImage: eventImage == null ? this.eventImage : eventImage.value,
      eventLocation: eventLocation == null ? this.eventLocation : eventLocation.value,
      isEventOnline: isEventOnline == null ? this.isEventOnline : isEventOnline.value
    );
  }
  
  Events.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _eventName = json['eventName'],
      _eventProvider = json['eventProvider'],
      _eventTag = json['eventTag'],
      _eventParticipants = json['eventParticipants'],
      _eventFee = json['eventFee'],
      _eventTiming = json['eventTiming'],
      _eventImage = json['eventImage'],
      _eventLocation = json['eventLocation'],
      _isEventOnline = json['isEventOnline'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'eventName': _eventName, 'eventProvider': _eventProvider, 'eventTag': _eventTag, 'eventParticipants': _eventParticipants, 'eventFee': _eventFee, 'eventTiming': _eventTiming, 'eventImage': _eventImage, 'eventLocation': _eventLocation, 'isEventOnline': _isEventOnline, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'eventName': _eventName,
    'eventProvider': _eventProvider,
    'eventTag': _eventTag,
    'eventParticipants': _eventParticipants,
    'eventFee': _eventFee,
    'eventTiming': _eventTiming,
    'eventImage': _eventImage,
    'eventLocation': _eventLocation,
    'isEventOnline': _isEventOnline,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EventsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EVENTNAME = amplify_core.QueryField(fieldName: "eventName");
  static final EVENTPROVIDER = amplify_core.QueryField(fieldName: "eventProvider");
  static final EVENTTAG = amplify_core.QueryField(fieldName: "eventTag");
  static final EVENTPARTICIPANTS = amplify_core.QueryField(fieldName: "eventParticipants");
  static final EVENTFEE = amplify_core.QueryField(fieldName: "eventFee");
  static final EVENTTIMING = amplify_core.QueryField(fieldName: "eventTiming");
  static final EVENTIMAGE = amplify_core.QueryField(fieldName: "eventImage");
  static final EVENTLOCATION = amplify_core.QueryField(fieldName: "eventLocation");
  static final ISEVENTONLINE = amplify_core.QueryField(fieldName: "isEventOnline");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Events";
    modelSchemaDefinition.pluralName = "Events";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTPROVIDER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTTAG,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTPARTICIPANTS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTFEE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTTIMING,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTIMAGE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTLOCATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.ISEVENTONLINE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _EventsModelType extends amplify_core.ModelType<Events> {
  const _EventsModelType();
  
  @override
  Events fromJson(Map<String, dynamic> jsonData) {
    return Events.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Events';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Events] in your schema.
 */
class EventsModelIdentifier implements amplify_core.ModelIdentifier<Events> {
  final String id;

  /** Create an instance of EventsModelIdentifier using [id] the primary key. */
  const EventsModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'EventsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}