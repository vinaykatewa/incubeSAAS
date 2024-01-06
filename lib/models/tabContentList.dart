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


/** This is an auto generated class representing the tabContentList type in your schema. */
class tabContentList {
  final List<tabDetails>? _tabDetailsList;

  List<tabDetails> get tabDetailsList {
    try {
      return _tabDetailsList!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const tabContentList._internal({required tabDetailsList}): _tabDetailsList = tabDetailsList;
  
  factory tabContentList({required List<tabDetails> tabDetailsList}) {
    return tabContentList._internal(
      tabDetailsList: tabDetailsList != null ? List<tabDetails>.unmodifiable(tabDetailsList) : tabDetailsList);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is tabContentList &&
      DeepCollectionEquality().equals(_tabDetailsList, other._tabDetailsList);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("tabContentList {");
    buffer.write("tabDetailsList=" + (_tabDetailsList != null ? _tabDetailsList!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  tabContentList copyWith({List<tabDetails>? tabDetailsList}) {
    return tabContentList._internal(
      tabDetailsList: tabDetailsList ?? this.tabDetailsList);
  }
  
  tabContentList copyWithModelFieldValues({
    ModelFieldValue<List<tabDetails>?>? tabDetailsList
  }) {
    return tabContentList._internal(
      tabDetailsList: tabDetailsList == null ? this.tabDetailsList : tabDetailsList.value
    );
  }
  
  tabContentList.fromJson(Map<String, dynamic> json)  
    : _tabDetailsList = json['tabDetailsList'] is List
        ? (json['tabDetailsList'] as List)
          .where((e) => e != null)
          .map((e) => tabDetails.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'tabDetailsList': _tabDetailsList?.map((tabDetails? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'tabDetailsList': _tabDetailsList
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "tabContentList";
    modelSchemaDefinition.pluralName = "tabContentLists";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'tabDetailsList',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'tabDetails')
    ));
  });
}