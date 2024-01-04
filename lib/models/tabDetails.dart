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


/** This is an auto generated class representing the tabDetails type in your schema. */
class tabDetails {
  final String? _tabContentHeader;
  final String? _tabContentBody;

  String get tabContentHeader {
    try {
      return _tabContentHeader!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get tabContentBody {
    try {
      return _tabContentBody!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const tabDetails._internal({required tabContentHeader, required tabContentBody}): _tabContentHeader = tabContentHeader, _tabContentBody = tabContentBody;
  
  factory tabDetails({required String tabContentHeader, required String tabContentBody}) {
    return tabDetails._internal(
      tabContentHeader: tabContentHeader,
      tabContentBody: tabContentBody);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is tabDetails &&
      _tabContentHeader == other._tabContentHeader &&
      _tabContentBody == other._tabContentBody;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("tabDetails {");
    buffer.write("tabContentHeader=" + "$_tabContentHeader" + ", ");
    buffer.write("tabContentBody=" + "$_tabContentBody");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  tabDetails copyWith({String? tabContentHeader, String? tabContentBody}) {
    return tabDetails._internal(
      tabContentHeader: tabContentHeader ?? this.tabContentHeader,
      tabContentBody: tabContentBody ?? this.tabContentBody);
  }
  
  tabDetails copyWithModelFieldValues({
    ModelFieldValue<String>? tabContentHeader,
    ModelFieldValue<String>? tabContentBody
  }) {
    return tabDetails._internal(
      tabContentHeader: tabContentHeader == null ? this.tabContentHeader : tabContentHeader.value,
      tabContentBody: tabContentBody == null ? this.tabContentBody : tabContentBody.value
    );
  }
  
  tabDetails.fromJson(Map<String, dynamic> json)  
    : _tabContentHeader = json['tabContentHeader'],
      _tabContentBody = json['tabContentBody'];
  
  Map<String, dynamic> toJson() => {
    'tabContentHeader': _tabContentHeader, 'tabContentBody': _tabContentBody
  };
  
  Map<String, Object?> toMap() => {
    'tabContentHeader': _tabContentHeader,
    'tabContentBody': _tabContentBody
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "tabDetails";
    modelSchemaDefinition.pluralName = "tabDetails";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabContentHeader',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabContentBody',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}