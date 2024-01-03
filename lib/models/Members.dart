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


/** This is an auto generated class representing the Members type in your schema. */
class Members {
  final String? _userId;
  final String? _memberName;
  final String? _memberEmail;
  final List<String>? _deals;

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
  
  String get memberName {
    try {
      return _memberName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get memberEmail {
    try {
      return _memberEmail!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get deals {
    try {
      return _deals!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Members._internal({required userId, required memberName, required memberEmail, required deals}): _userId = userId, _memberName = memberName, _memberEmail = memberEmail, _deals = deals;
  
  factory Members({required String userId, required String memberName, required String memberEmail, required List<String> deals}) {
    return Members._internal(
      userId: userId,
      memberName: memberName,
      memberEmail: memberEmail,
      deals: deals != null ? List<String>.unmodifiable(deals) : deals);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Members &&
      _userId == other._userId &&
      _memberName == other._memberName &&
      _memberEmail == other._memberEmail &&
      DeepCollectionEquality().equals(_deals, other._deals);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Members {");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("memberName=" + "$_memberName" + ", ");
    buffer.write("memberEmail=" + "$_memberEmail" + ", ");
    buffer.write("deals=" + (_deals != null ? _deals!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Members copyWith({String? userId, String? memberName, String? memberEmail, List<String>? deals}) {
    return Members._internal(
      userId: userId ?? this.userId,
      memberName: memberName ?? this.memberName,
      memberEmail: memberEmail ?? this.memberEmail,
      deals: deals ?? this.deals);
  }
  
  Members copyWithModelFieldValues({
    ModelFieldValue<String>? userId,
    ModelFieldValue<String>? memberName,
    ModelFieldValue<String>? memberEmail,
    ModelFieldValue<List<String>?>? deals
  }) {
    return Members._internal(
      userId: userId == null ? this.userId : userId.value,
      memberName: memberName == null ? this.memberName : memberName.value,
      memberEmail: memberEmail == null ? this.memberEmail : memberEmail.value,
      deals: deals == null ? this.deals : deals.value
    );
  }
  
  Members.fromJson(Map<String, dynamic> json)  
    : _userId = json['userId'],
      _memberName = json['memberName'],
      _memberEmail = json['memberEmail'],
      _deals = json['deals']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'userId': _userId, 'memberName': _memberName, 'memberEmail': _memberEmail, 'deals': _deals
  };
  
  Map<String, Object?> toMap() => {
    'userId': _userId,
    'memberName': _memberName,
    'memberEmail': _memberEmail,
    'deals': _deals
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Members";
    modelSchemaDefinition.pluralName = "Members";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'memberName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'memberEmail',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'deals',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
  });
}