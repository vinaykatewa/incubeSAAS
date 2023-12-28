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


/** This is an auto generated class representing the Team type in your schema. */
class Team {
  final String id;
  final String? _org_id;
  final String? _userUid;
  final String? _userName;
  final String? _userAdmin;
  final String? _teamName;

  String get org_id {
    try {
      return _org_id!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userUid {
    try {
      return _userUid!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userName {
    try {
      return _userName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userAdmin {
    try {
      return _userAdmin!;
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
  
  const Team._internal({required this.id, required org_id, required userUid, required userName, required userAdmin, required teamName}): _org_id = org_id, _userUid = userUid, _userName = userName, _userAdmin = userAdmin, _teamName = teamName;
  
  factory Team({String? id, required String org_id, required String userUid, required String userName, required String userAdmin, required String teamName}) {
    return Team._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      org_id: org_id,
      userUid: userUid,
      userName: userName,
      userAdmin: userAdmin,
      teamName: teamName);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Team &&
      id == other.id &&
      _org_id == other._org_id &&
      _userUid == other._userUid &&
      _userName == other._userName &&
      _userAdmin == other._userAdmin &&
      _teamName == other._teamName;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Team {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("org_id=" + "$_org_id" + ", ");
    buffer.write("userUid=" + "$_userUid" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("userAdmin=" + "$_userAdmin" + ", ");
    buffer.write("teamName=" + "$_teamName");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Team copyWith({String? id, String? org_id, String? userUid, String? userName, String? userAdmin, String? teamName}) {
    return Team._internal(
      id: id ?? this.id,
      org_id: org_id ?? this.org_id,
      userUid: userUid ?? this.userUid,
      userName: userName ?? this.userName,
      userAdmin: userAdmin ?? this.userAdmin,
      teamName: teamName ?? this.teamName);
  }
  
  Team copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? org_id,
    ModelFieldValue<String>? userUid,
    ModelFieldValue<String>? userName,
    ModelFieldValue<String>? userAdmin,
    ModelFieldValue<String>? teamName
  }) {
    return Team._internal(
      id: id == null ? this.id : id.value,
      org_id: org_id == null ? this.org_id : org_id.value,
      userUid: userUid == null ? this.userUid : userUid.value,
      userName: userName == null ? this.userName : userName.value,
      userAdmin: userAdmin == null ? this.userAdmin : userAdmin.value,
      teamName: teamName == null ? this.teamName : teamName.value
    );
  }
  
  Team.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _org_id = json['org_id'],
      _userUid = json['userUid'],
      _userName = json['userName'],
      _userAdmin = json['userAdmin'],
      _teamName = json['teamName'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'org_id': _org_id, 'userUid': _userUid, 'userName': _userName, 'userAdmin': _userAdmin, 'teamName': _teamName
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'org_id': _org_id,
    'userUid': _userUid,
    'userName': _userName,
    'userAdmin': _userAdmin,
    'teamName': _teamName
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Team";
    modelSchemaDefinition.pluralName = "Teams";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'org_id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userUid',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userAdmin',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}