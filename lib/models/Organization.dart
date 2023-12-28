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


/** This is an auto generated class representing the Organization type in your schema. */
class Organization extends amplify_core.Model {
  static const classType = const _OrganizationModelType();
  final String id;
  final String? _org_name;
  final String? _org_admin;
  final List<Deals>? _org_deals;
  final List<Team>? _org_team;
  final String? _uid;
  final String? _userName;
  final String? _email;
  final String? _imageUrl;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OrganizationModelIdentifier get modelIdentifier {
      return OrganizationModelIdentifier(
        id: id
      );
  }
  
  String get org_name {
    try {
      return _org_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get org_admin {
    try {
      return _org_admin!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Deals>? get org_deals {
    return _org_deals;
  }
  
  List<Team>? get org_team {
    return _org_team;
  }
  
  String get uid {
    try {
      return _uid!;
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
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get imageUrl {
    try {
      return _imageUrl!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Organization._internal({required this.id, required org_name, required org_admin, org_deals, org_team, required uid, required userName, required email, required imageUrl, createdAt, updatedAt}): _org_name = org_name, _org_admin = org_admin, _org_deals = org_deals, _org_team = org_team, _uid = uid, _userName = userName, _email = email, _imageUrl = imageUrl, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Organization({String? id, required String org_name, required String org_admin, List<Deals>? org_deals, List<Team>? org_team, required String uid, required String userName, required String email, required String imageUrl}) {
    return Organization._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      org_name: org_name,
      org_admin: org_admin,
      org_deals: org_deals != null ? List<Deals>.unmodifiable(org_deals) : org_deals,
      org_team: org_team != null ? List<Team>.unmodifiable(org_team) : org_team,
      uid: uid,
      userName: userName,
      email: email,
      imageUrl: imageUrl);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organization &&
      id == other.id &&
      _org_name == other._org_name &&
      _org_admin == other._org_admin &&
      DeepCollectionEquality().equals(_org_deals, other._org_deals) &&
      DeepCollectionEquality().equals(_org_team, other._org_team) &&
      _uid == other._uid &&
      _userName == other._userName &&
      _email == other._email &&
      _imageUrl == other._imageUrl;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Organization {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("org_name=" + "$_org_name" + ", ");
    buffer.write("org_admin=" + "$_org_admin" + ", ");
    buffer.write("org_deals=" + (_org_deals != null ? _org_deals!.toString() : "null") + ", ");
    buffer.write("org_team=" + (_org_team != null ? _org_team!.toString() : "null") + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Organization copyWith({String? org_name, String? org_admin, List<Deals>? org_deals, List<Team>? org_team, String? uid, String? userName, String? email, String? imageUrl}) {
    return Organization._internal(
      id: id,
      org_name: org_name ?? this.org_name,
      org_admin: org_admin ?? this.org_admin,
      org_deals: org_deals ?? this.org_deals,
      org_team: org_team ?? this.org_team,
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl);
  }
  
  Organization copyWithModelFieldValues({
    ModelFieldValue<String>? org_name,
    ModelFieldValue<String>? org_admin,
    ModelFieldValue<List<Deals>?>? org_deals,
    ModelFieldValue<List<Team>?>? org_team,
    ModelFieldValue<String>? uid,
    ModelFieldValue<String>? userName,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? imageUrl
  }) {
    return Organization._internal(
      id: id,
      org_name: org_name == null ? this.org_name : org_name.value,
      org_admin: org_admin == null ? this.org_admin : org_admin.value,
      org_deals: org_deals == null ? this.org_deals : org_deals.value,
      org_team: org_team == null ? this.org_team : org_team.value,
      uid: uid == null ? this.uid : uid.value,
      userName: userName == null ? this.userName : userName.value,
      email: email == null ? this.email : email.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value
    );
  }
  
  Organization.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _org_name = json['org_name'],
      _org_admin = json['org_admin'],
      _org_deals = json['org_deals'] is List
        ? (json['org_deals'] as List)
          .where((e) => e != null)
          .map((e) => Deals.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _org_team = json['org_team'] is List
        ? (json['org_team'] as List)
          .where((e) => e != null)
          .map((e) => Team.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _uid = json['uid'],
      _userName = json['userName'],
      _email = json['email'],
      _imageUrl = json['imageUrl'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'org_name': _org_name, 'org_admin': _org_admin, 'org_deals': _org_deals?.map((Deals? e) => e?.toJson()).toList(), 'org_team': _org_team?.map((Team? e) => e?.toJson()).toList(), 'uid': _uid, 'userName': _userName, 'email': _email, 'imageUrl': _imageUrl, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'org_name': _org_name,
    'org_admin': _org_admin,
    'org_deals': _org_deals,
    'org_team': _org_team,
    'uid': _uid,
    'userName': _userName,
    'email': _email,
    'imageUrl': _imageUrl,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<OrganizationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<OrganizationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ORG_NAME = amplify_core.QueryField(fieldName: "org_name");
  static final ORG_ADMIN = amplify_core.QueryField(fieldName: "org_admin");
  static final ORG_DEALS = amplify_core.QueryField(fieldName: "org_deals");
  static final ORG_TEAM = amplify_core.QueryField(fieldName: "org_team");
  static final UID = amplify_core.QueryField(fieldName: "uid");
  static final USERNAME = amplify_core.QueryField(fieldName: "userName");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Organization";
    modelSchemaDefinition.pluralName = "Organizations";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organization.ORG_NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organization.ORG_ADMIN,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'org_deals',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Deals')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'org_team',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Team')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organization.UID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organization.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organization.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organization.IMAGEURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OrganizationModelType extends amplify_core.ModelType<Organization> {
  const _OrganizationModelType();
  
  @override
  Organization fromJson(Map<String, dynamic> jsonData) {
    return Organization.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Organization';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Organization] in your schema.
 */
class OrganizationModelIdentifier implements amplify_core.ModelIdentifier<Organization> {
  final String id;

  /** Create an instance of OrganizationModelIdentifier using [id] the primary key. */
  const OrganizationModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'OrganizationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OrganizationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}