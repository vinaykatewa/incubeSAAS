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


/** This is an auto generated class representing the usersPersonalSheets type in your schema. */
class usersPersonalSheets {
  final String? _folderName;
  final List<String>? _googleSheet;

  String get folderName {
    try {
      return _folderName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get googleSheet {
    try {
      return _googleSheet!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const usersPersonalSheets._internal({required folderName, required googleSheet}): _folderName = folderName, _googleSheet = googleSheet;
  
  factory usersPersonalSheets({required String folderName, required List<String> googleSheet}) {
    return usersPersonalSheets._internal(
      folderName: folderName,
      googleSheet: googleSheet != null ? List<String>.unmodifiable(googleSheet) : googleSheet);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is usersPersonalSheets &&
      _folderName == other._folderName &&
      DeepCollectionEquality().equals(_googleSheet, other._googleSheet);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("usersPersonalSheets {");
    buffer.write("folderName=" + "$_folderName" + ", ");
    buffer.write("googleSheet=" + (_googleSheet != null ? _googleSheet!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  usersPersonalSheets copyWith({String? folderName, List<String>? googleSheet}) {
    return usersPersonalSheets._internal(
      folderName: folderName ?? this.folderName,
      googleSheet: googleSheet ?? this.googleSheet);
  }
  
  usersPersonalSheets copyWithModelFieldValues({
    ModelFieldValue<String>? folderName,
    ModelFieldValue<List<String>>? googleSheet
  }) {
    return usersPersonalSheets._internal(
      folderName: folderName == null ? this.folderName : folderName.value,
      googleSheet: googleSheet == null ? this.googleSheet : googleSheet.value
    );
  }
  
  usersPersonalSheets.fromJson(Map<String, dynamic> json)  
    : _folderName = json['folderName'],
      _googleSheet = json['googleSheet']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'folderName': _folderName, 'googleSheet': _googleSheet
  };
  
  Map<String, Object?> toMap() => {
    'folderName': _folderName,
    'googleSheet': _googleSheet
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "usersPersonalSheets";
    modelSchemaDefinition.pluralName = "usersPersonalSheets";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'folderName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'googleSheet',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
  });
}