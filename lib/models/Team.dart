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


/** This is an auto generated class representing the Team type in your schema. */
class Team {
  final String? _idTeam;
  final String? _teamName;
  final String? _teamLeader;
  final List<String>? _member;
  final List<String>? _dealIDs;

  String get idTeam {
    try {
      return _idTeam!;
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
  
  String get teamLeader {
    try {
      return _teamLeader!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get member {
    try {
      return _member!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get dealIDs {
    try {
      return _dealIDs!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Team._internal({required idTeam, required teamName, required teamLeader, required member, required dealIDs}): _idTeam = idTeam, _teamName = teamName, _teamLeader = teamLeader, _member = member, _dealIDs = dealIDs;
  
  factory Team({required String idTeam, required String teamName, required String teamLeader, required List<String> member, required List<String> dealIDs}) {
    return Team._internal(
      idTeam: idTeam,
      teamName: teamName,
      teamLeader: teamLeader,
      member: member != null ? List<String>.unmodifiable(member) : member,
      dealIDs: dealIDs != null ? List<String>.unmodifiable(dealIDs) : dealIDs);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Team &&
      _idTeam == other._idTeam &&
      _teamName == other._teamName &&
      _teamLeader == other._teamLeader &&
      DeepCollectionEquality().equals(_member, other._member) &&
      DeepCollectionEquality().equals(_dealIDs, other._dealIDs);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Team {");
    buffer.write("idTeam=" + "$_idTeam" + ", ");
    buffer.write("teamName=" + "$_teamName" + ", ");
    buffer.write("teamLeader=" + "$_teamLeader" + ", ");
    buffer.write("member=" + (_member != null ? _member!.toString() : "null") + ", ");
    buffer.write("dealIDs=" + (_dealIDs != null ? _dealIDs!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Team copyWith({String? idTeam, String? teamName, String? teamLeader, List<String>? member, List<String>? dealIDs}) {
    return Team._internal(
      idTeam: idTeam ?? this.idTeam,
      teamName: teamName ?? this.teamName,
      teamLeader: teamLeader ?? this.teamLeader,
      member: member ?? this.member,
      dealIDs: dealIDs ?? this.dealIDs);
  }
  
  Team copyWithModelFieldValues({
    ModelFieldValue<String>? idTeam,
    ModelFieldValue<String>? teamName,
    ModelFieldValue<String>? teamLeader,
    ModelFieldValue<List<String>?>? member,
    ModelFieldValue<List<String>?>? dealIDs
  }) {
    return Team._internal(
      idTeam: idTeam == null ? this.idTeam : idTeam.value,
      teamName: teamName == null ? this.teamName : teamName.value,
      teamLeader: teamLeader == null ? this.teamLeader : teamLeader.value,
      member: member == null ? this.member : member.value,
      dealIDs: dealIDs == null ? this.dealIDs : dealIDs.value
    );
  }
  
  Team.fromJson(Map<String, dynamic> json)  
    : _idTeam = json['idTeam'],
      _teamName = json['teamName'],
      _teamLeader = json['teamLeader'],
      _member = json['member']?.cast<String>(),
      _dealIDs = json['dealIDs']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'idTeam': _idTeam, 'teamName': _teamName, 'teamLeader': _teamLeader, 'member': _member, 'dealIDs': _dealIDs
  };
  
  Map<String, Object?> toMap() => {
    'idTeam': _idTeam,
    'teamName': _teamName,
    'teamLeader': _teamLeader,
    'member': _member,
    'dealIDs': _dealIDs
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Team";
    modelSchemaDefinition.pluralName = "Teams";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'idTeam',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamLeader',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'member',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'dealIDs',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
  });
}