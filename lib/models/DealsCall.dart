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
  final List<String>? _tabList;
  final List<String>? _tabTitles;
  final List<tabDetails>? _tabContent;

  List<String> get tabList {
    try {
      return _tabList!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get tabTitles {
    try {
      return _tabTitles!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<tabDetails> get tabContent {
    try {
      return _tabContent!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const DealsCall._internal({required tabList, required tabTitles, required tabContent}): _tabList = tabList, _tabTitles = tabTitles, _tabContent = tabContent;
  
  factory DealsCall({required List<String> tabList, required List<String> tabTitles, required List<tabDetails> tabContent}) {
    return DealsCall._internal(
      tabList: tabList != null ? List<String>.unmodifiable(tabList) : tabList,
      tabTitles: tabTitles != null ? List<String>.unmodifiable(tabTitles) : tabTitles,
      tabContent: tabContent != null ? List<tabDetails>.unmodifiable(tabContent) : tabContent);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DealsCall &&
      DeepCollectionEquality().equals(_tabList, other._tabList) &&
      DeepCollectionEquality().equals(_tabTitles, other._tabTitles) &&
      DeepCollectionEquality().equals(_tabContent, other._tabContent);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DealsCall {");
    buffer.write("tabList=" + (_tabList != null ? _tabList!.toString() : "null") + ", ");
    buffer.write("tabTitles=" + (_tabTitles != null ? _tabTitles!.toString() : "null") + ", ");
    buffer.write("tabContent=" + (_tabContent != null ? _tabContent!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DealsCall copyWith({List<String>? tabList, List<String>? tabTitles, List<tabDetails>? tabContent}) {
    return DealsCall._internal(
      tabList: tabList ?? this.tabList,
      tabTitles: tabTitles ?? this.tabTitles,
      tabContent: tabContent ?? this.tabContent);
  }
  
  DealsCall copyWithModelFieldValues({
    ModelFieldValue<List<String>?>? tabList,
    ModelFieldValue<List<String>?>? tabTitles,
    ModelFieldValue<List<tabDetails>?>? tabContent
  }) {
    return DealsCall._internal(
      tabList: tabList == null ? this.tabList : tabList.value,
      tabTitles: tabTitles == null ? this.tabTitles : tabTitles.value,
      tabContent: tabContent == null ? this.tabContent : tabContent.value
    );
  }
  
  DealsCall.fromJson(Map<String, dynamic> json)  
    : _tabList = json['tabList']?.cast<String>(),
      _tabTitles = json['tabTitles']?.cast<String>(),
      _tabContent = json['tabContent'] is List
        ? (json['tabContent'] as List)
          .where((e) => e != null)
          .map((e) => tabDetails.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'tabList': _tabList, 'tabTitles': _tabTitles, 'tabContent': _tabContent?.map((tabDetails? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'tabList': _tabList,
    'tabTitles': _tabTitles,
    'tabContent': _tabContent
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DealsCall";
    modelSchemaDefinition.pluralName = "DealsCalls";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabList',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'tabTitles',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'tabContent',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'tabDetails')
    ));
  });
}