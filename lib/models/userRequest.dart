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


/** This is an auto generated class representing the userRequest type in your schema. */
class userRequest {
  final String id;
  final String? _userName;
  final String? _userEmail;
  final String? _userId;
  final String? _status;

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
  
  String get userEmail {
    try {
      return _userEmail!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userId {
    try {
      return _userId!;
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
  
  const userRequest._internal({required this.id, required userName, required userEmail, required userId, required status}): _userName = userName, _userEmail = userEmail, _userId = userId, _status = status;
  
  factory userRequest({String? id, required String userName, required String userEmail, required String userId, required String status}) {
    return userRequest._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      userName: userName,
      userEmail: userEmail,
      userId: userId,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is userRequest &&
      id == other.id &&
      _userName == other._userName &&
      _userEmail == other._userEmail &&
      _userId == other._userId &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("userRequest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("userEmail=" + "$_userEmail" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("status=" + "$_status");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  userRequest copyWith({String? id, String? userName, String? userEmail, String? userId, String? status}) {
    return userRequest._internal(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userId: userId ?? this.userId,
      status: status ?? this.status);
  }
  
  userRequest copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? userName,
    ModelFieldValue<String>? userEmail,
    ModelFieldValue<String>? userId,
    ModelFieldValue<String>? status
  }) {
    return userRequest._internal(
      id: id == null ? this.id : id.value,
      userName: userName == null ? this.userName : userName.value,
      userEmail: userEmail == null ? this.userEmail : userEmail.value,
      userId: userId == null ? this.userId : userId.value,
      status: status == null ? this.status : status.value
    );
  }
  
  userRequest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userName = json['userName'],
      _userEmail = json['userEmail'],
      _userId = json['userId'],
      _status = json['status'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userName': _userName, 'userEmail': _userEmail, 'userId': _userId, 'status': _status
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'userName': _userName,
    'userEmail': _userEmail,
    'userId': _userId,
    'status': _status
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "userRequest";
    modelSchemaDefinition.pluralName = "userRequests";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userEmail',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}