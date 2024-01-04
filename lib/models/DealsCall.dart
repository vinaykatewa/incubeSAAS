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


/** This is an auto generated class representing the DealsCall type in your schema. */
class DealsCall {
  final String? _tabName;
  final List<String>? _tabContentHeader;
  final List<String>? _tabContentBody;

  String get tabName {
    try {
      return _tabName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get tabContentHeader {
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
  
  List<String> get tabContentBody {
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
  
  const DealsCall._internal({required tabName, required tabContentHeader, required tabContentBody}): _tabName = tabName, _tabContentHeader = tabContentHeader, _tabContentBody = tabContentBody;
  
  factory DealsCall({required String tabName, required List<String> tabContentHeader, required List<String> tabContentBody}) {
    return DealsCall._internal(
      tabName: tabName,
      tabContentHeader: tabContentHeader != null ? List<String>.unmodifiable(tabContentHeader) : tabContentHeader,
      tabContentBody: tabContentBody != null ? List<String>.unmodifiable(tabContentBody) : tabContentBody);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DealsCall &&
      _tabName == other._tabName &&
      DeepCollectionEquality().equals(_tabContentHeader, other._tabContentHeader) &&
      DeepCollectionEquality().equals(_tabContentBody, other._tabContentBody);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DealsCall {");
    buffer.write("tabName=" + "$_tabName" + ", ");
    buffer.write("tabContentHeader=" + (_tabContentHeader != null ? _tabContentHeader!.toString() : "null") + ", ");
    buffer.write("tabContentBody=" + (_tabContentBody != null ? _tabContentBody!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DealsCall copyWith({String? tabName, List<String>? tabContentHeader, List<String>? tabContentBody}) {
    return DealsCall._internal(
      tabName: tabName ?? this.tabName,
      tabContentHeader: tabContentHeader ?? this.tabContentHeader,
      tabContentBody: tabContentBody ?? this.tabContentBody);
  }
  
  DealsCall copyWithModelFieldValues({
    ModelFieldValue<String>? tabName,
    ModelFieldValue<List<String>?>? tabContentHeader,
    ModelFieldValue<List<String>?>? tabContentBody
  }) {
    return DealsCall._internal(
      tabName: tabName == null ? this.tabName : tabName.value,
      tabContentHeader: tabContentHeader == null ? this.tabContentHeader : tabContentHeader.value,
      tabContentBody: tabContentBody == null ? this.tabContentBody : tabContentBody.value
    );
  }
  
  DealsCall.fromJson(Map<String, dynamic> json)  
    : _tabName = json['tabName'],
      _tabContentHeader = json['tabContentHeader']?.cast<String>(),
      _tabContentBody = json['tabContentBody']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'tabName': _tabName, 'tabContentHeader': _tabContentHeader, 'tabContentBody': _tabContentBody
  };
  
  Map<String, Object?> toMap() => {
    'tabName': _tabName,
    'tabContentHeader': _tabContentHeader,
    'tabContentBody': _tabContentBody
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DealsCall";
    modelSchemaDefinition.pluralName = "DealsCalls";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabContentHeader',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabContentBody',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
  });
}