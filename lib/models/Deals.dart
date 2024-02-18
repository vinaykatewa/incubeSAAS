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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Deals type in your schema. */
class Deals {
  final String? _idDeal;
  final String? _teamId;
  final String? _teamName;
  final String? _company_logo;
  final String? _company_name;
  final String? _company_description;
  final String? _seeking;
  final String? _status;
  final DealsCall? _calls;
  final List<Meeting>? _meetings;
  final List<String>? _documents;

  String get idDeal {
    try {
      return _idDeal!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get teamId {
    try {
      return _teamId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get teamName {
    try {
      return _teamName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get company_logo {
    try {
      return _company_logo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get company_name {
    try {
      return _company_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get company_description {
    try {
      return _company_description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get seeking {
    try {
      return _seeking!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DealsCall get calls {
    try {
      return _calls!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Meeting> get meetings {
    try {
      return _meetings!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get documents {
    try {
      return _documents!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Deals._internal({required idDeal, required teamId, required teamName, required company_logo, required company_name, required company_description, required seeking, required status, required calls, required meetings, required documents}): _idDeal = idDeal, _teamId = teamId, _teamName = teamName, _company_logo = company_logo, _company_name = company_name, _company_description = company_description, _seeking = seeking, _status = status, _calls = calls, _meetings = meetings, _documents = documents;
  
  factory Deals({required String idDeal, required String teamId, required String teamName, required String company_logo, required String company_name, required String company_description, required String seeking, required String status, required DealsCall calls, required List<Meeting> meetings, required List<String> documents}) {
    return Deals._internal(
      idDeal: idDeal,
      teamId: teamId,
      teamName: teamName,
      company_logo: company_logo,
      company_name: company_name,
      company_description: company_description,
      seeking: seeking,
      status: status,
      calls: calls,
      meetings: meetings != null ? List<Meeting>.unmodifiable(meetings) : meetings,
      documents: documents != null ? List<String>.unmodifiable(documents) : documents);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Deals &&
      _idDeal == other._idDeal &&
      _teamId == other._teamId &&
      _teamName == other._teamName &&
      _company_logo == other._company_logo &&
      _company_name == other._company_name &&
      _company_description == other._company_description &&
      _seeking == other._seeking &&
      _status == other._status &&
      _calls == other._calls &&
      DeepCollectionEquality().equals(_meetings, other._meetings) &&
      DeepCollectionEquality().equals(_documents, other._documents);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Deals {");
    buffer.write("idDeal=" + "$_idDeal" + ", ");
    buffer.write("teamId=" + "$_teamId" + ", ");
    buffer.write("teamName=" + "$_teamName" + ", ");
    buffer.write("company_logo=" + "$_company_logo" + ", ");
    buffer.write("company_name=" + "$_company_name" + ", ");
    buffer.write("company_description=" + "$_company_description" + ", ");
    buffer.write("seeking=" + "$_seeking" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("calls=" + (_calls != null ? _calls!.toString() : "null") + ", ");
    buffer.write("meetings=" + (_meetings != null ? _meetings!.toString() : "null") + ", ");
    buffer.write("documents=" + (_documents != null ? _documents!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Deals copyWith({String? idDeal, String? teamId, String? teamName, String? company_logo, String? company_name, String? company_description, String? seeking, String? status, DealsCall? calls, List<Meeting>? meetings, List<String>? documents}) {
    return Deals._internal(
      idDeal: idDeal ?? this.idDeal,
      teamId: teamId ?? this.teamId,
      teamName: teamName ?? this.teamName,
      company_logo: company_logo ?? this.company_logo,
      company_name: company_name ?? this.company_name,
      company_description: company_description ?? this.company_description,
      seeking: seeking ?? this.seeking,
      status: status ?? this.status,
      calls: calls ?? this.calls,
      meetings: meetings ?? this.meetings,
      documents: documents ?? this.documents);
  }
  
  Deals copyWithModelFieldValues({
    ModelFieldValue<String>? idDeal,
    ModelFieldValue<String>? teamId,
    ModelFieldValue<String>? teamName,
    ModelFieldValue<String>? company_logo,
    ModelFieldValue<String>? company_name,
    ModelFieldValue<String>? company_description,
    ModelFieldValue<String>? seeking,
    ModelFieldValue<String>? status,
    ModelFieldValue<DealsCall>? calls,
    ModelFieldValue<List<Meeting>?>? meetings,
    ModelFieldValue<List<String>?>? documents
  }) {
    return Deals._internal(
      idDeal: idDeal == null ? this.idDeal : idDeal.value,
      teamId: teamId == null ? this.teamId : teamId.value,
      teamName: teamName == null ? this.teamName : teamName.value,
      company_logo: company_logo == null ? this.company_logo : company_logo.value,
      company_name: company_name == null ? this.company_name : company_name.value,
      company_description: company_description == null ? this.company_description : company_description.value,
      seeking: seeking == null ? this.seeking : seeking.value,
      status: status == null ? this.status : status.value,
      calls: calls == null ? this.calls : calls.value,
      meetings: meetings == null ? this.meetings : meetings.value,
      documents: documents == null ? this.documents : documents.value
    );
  }
  
  Deals.fromJson(Map<String, dynamic> json)  
    : _idDeal = json['idDeal'],
      _teamId = json['teamId'],
      _teamName = json['teamName'],
      _company_logo = json['company_logo'],
      _company_name = json['company_name'],
      _company_description = json['company_description'],
      _seeking = json['seeking'],
      _status = json['status'],
      _calls = json['calls']?['serializedData'] != null
        ? DealsCall.fromJson(new Map<String, dynamic>.from(json['calls']['serializedData']))
        : null,
      _meetings = json['meetings'] is List
        ? (json['meetings'] as List)
          .where((e) => e != null)
          .map((e) => Meeting.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _documents = json['documents']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'idDeal': _idDeal, 'teamId': _teamId, 'teamName': _teamName, 'company_logo': _company_logo, 'company_name': _company_name, 'company_description': _company_description, 'seeking': _seeking, 'status': _status, 'calls': _calls?.toJson(), 'meetings': _meetings?.map((Meeting? e) => e?.toJson()).toList(), 'documents': _documents
  };
  
  Map<String, Object?> toMap() => {
    'idDeal': _idDeal,
    'teamId': _teamId,
    'teamName': _teamName,
    'company_logo': _company_logo,
    'company_name': _company_name,
    'company_description': _company_description,
    'seeking': _seeking,
    'status': _status,
    'calls': _calls,
    'meetings': _meetings,
    'documents': _documents
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Deals";
    modelSchemaDefinition.pluralName = "Deals";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'idDeal',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'company_logo',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'company_name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'company_description',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'seeking',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'calls',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DealsCall')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'meetings',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Meeting')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'documents',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
  });
}