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


/** This is an auto generated class representing the Deals type in your schema. */
class Deals {
  final String? _idDeal;
  final String? _teamId;
  final String? _company_logo;
  final String? _company_name;
  final String? _company_description;
  final String? _seeking;
  final String? _status;

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
  
  const Deals._internal({required idDeal, required teamId, required company_logo, required company_name, required company_description, required seeking, required status}): _idDeal = idDeal, _teamId = teamId, _company_logo = company_logo, _company_name = company_name, _company_description = company_description, _seeking = seeking, _status = status;
  
  factory Deals({required String idDeal, required String teamId, required String company_logo, required String company_name, required String company_description, required String seeking, required String status}) {
    return Deals._internal(
      idDeal: idDeal,
      teamId: teamId,
      company_logo: company_logo,
      company_name: company_name,
      company_description: company_description,
      seeking: seeking,
      status: status);
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
      _company_logo == other._company_logo &&
      _company_name == other._company_name &&
      _company_description == other._company_description &&
      _seeking == other._seeking &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Deals {");
    buffer.write("idDeal=" + "$_idDeal" + ", ");
    buffer.write("teamId=" + "$_teamId" + ", ");
    buffer.write("company_logo=" + "$_company_logo" + ", ");
    buffer.write("company_name=" + "$_company_name" + ", ");
    buffer.write("company_description=" + "$_company_description" + ", ");
    buffer.write("seeking=" + "$_seeking" + ", ");
    buffer.write("status=" + "$_status");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Deals copyWith({String? idDeal, String? teamId, String? company_logo, String? company_name, String? company_description, String? seeking, String? status}) {
    return Deals._internal(
      idDeal: idDeal ?? this.idDeal,
      teamId: teamId ?? this.teamId,
      company_logo: company_logo ?? this.company_logo,
      company_name: company_name ?? this.company_name,
      company_description: company_description ?? this.company_description,
      seeking: seeking ?? this.seeking,
      status: status ?? this.status);
  }
  
  Deals copyWithModelFieldValues({
    ModelFieldValue<String>? idDeal,
    ModelFieldValue<String>? teamId,
    ModelFieldValue<String>? company_logo,
    ModelFieldValue<String>? company_name,
    ModelFieldValue<String>? company_description,
    ModelFieldValue<String>? seeking,
    ModelFieldValue<String>? status
  }) {
    return Deals._internal(
      idDeal: idDeal == null ? this.idDeal : idDeal.value,
      teamId: teamId == null ? this.teamId : teamId.value,
      company_logo: company_logo == null ? this.company_logo : company_logo.value,
      company_name: company_name == null ? this.company_name : company_name.value,
      company_description: company_description == null ? this.company_description : company_description.value,
      seeking: seeking == null ? this.seeking : seeking.value,
      status: status == null ? this.status : status.value
    );
  }
  
  Deals.fromJson(Map<String, dynamic> json)  
    : _idDeal = json['idDeal'],
      _teamId = json['teamId'],
      _company_logo = json['company_logo'],
      _company_name = json['company_name'],
      _company_description = json['company_description'],
      _seeking = json['seeking'],
      _status = json['status'];
  
  Map<String, dynamic> toJson() => {
    'idDeal': _idDeal, 'teamId': _teamId, 'company_logo': _company_logo, 'company_name': _company_name, 'company_description': _company_description, 'seeking': _seeking, 'status': _status
  };
  
  Map<String, Object?> toMap() => {
    'idDeal': _idDeal,
    'teamId': _teamId,
    'company_logo': _company_logo,
    'company_name': _company_name,
    'company_description': _company_description,
    'seeking': _seeking,
    'status': _status
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
  });
}