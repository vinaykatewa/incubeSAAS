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


/** This is an auto generated class representing the userInfo type in your schema. */
class userInfo extends amplify_core.Model {
  static const classType = const _userInfoModelType();
  final String? _uid;
  final String? _userName;
  final String? _email;
  final String? _imageUrl;
  final String? _organizationName;
  final String? _organizationId;
  final String? _adminId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  userInfoModelIdentifier get modelIdentifier {
    try {
      return userInfoModelIdentifier(
        uid: _uid!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String get organizationName {
    try {
      return _organizationName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get organizationId {
    try {
      return _organizationId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get adminId {
    try {
      return _adminId!;
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
  
  const userInfo._internal({required uid, required userName, required email, required imageUrl, required organizationName, required organizationId, required adminId, createdAt, updatedAt}): _uid = uid, _userName = userName, _email = email, _imageUrl = imageUrl, _organizationName = organizationName, _organizationId = organizationId, _adminId = adminId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory userInfo({required String uid, required String userName, required String email, required String imageUrl, required String organizationName, required String organizationId, required String adminId}) {
    return userInfo._internal(
      uid: uid,
      userName: userName,
      email: email,
      imageUrl: imageUrl,
      organizationName: organizationName,
      organizationId: organizationId,
      adminId: adminId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is userInfo &&
      _uid == other._uid &&
      _userName == other._userName &&
      _email == other._email &&
      _imageUrl == other._imageUrl &&
      _organizationName == other._organizationName &&
      _organizationId == other._organizationId &&
      _adminId == other._adminId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("userInfo {");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("organizationName=" + "$_organizationName" + ", ");
    buffer.write("organizationId=" + "$_organizationId" + ", ");
    buffer.write("adminId=" + "$_adminId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  userInfo copyWith({String? userName, String? email, String? imageUrl, String? organizationName, String? organizationId, String? adminId}) {
    return userInfo._internal(
      uid: uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      organizationName: organizationName ?? this.organizationName,
      organizationId: organizationId ?? this.organizationId,
      adminId: adminId ?? this.adminId);
  }
  
  userInfo copyWithModelFieldValues({
    ModelFieldValue<String>? userName,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? imageUrl,
    ModelFieldValue<String>? organizationName,
    ModelFieldValue<String>? organizationId,
    ModelFieldValue<String>? adminId
  }) {
    return userInfo._internal(
      uid: uid,
      userName: userName == null ? this.userName : userName.value,
      email: email == null ? this.email : email.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      organizationName: organizationName == null ? this.organizationName : organizationName.value,
      organizationId: organizationId == null ? this.organizationId : organizationId.value,
      adminId: adminId == null ? this.adminId : adminId.value
    );
  }
  
  userInfo.fromJson(Map<String, dynamic> json)  
    : _uid = json['uid'],
      _userName = json['userName'],
      _email = json['email'],
      _imageUrl = json['imageUrl'],
      _organizationName = json['organizationName'],
      _organizationId = json['organizationId'],
      _adminId = json['adminId'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'uid': _uid, 'userName': _userName, 'email': _email, 'imageUrl': _imageUrl, 'organizationName': _organizationName, 'organizationId': _organizationId, 'adminId': _adminId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'uid': _uid,
    'userName': _userName,
    'email': _email,
    'imageUrl': _imageUrl,
    'organizationName': _organizationName,
    'organizationId': _organizationId,
    'adminId': _adminId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<userInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<userInfoModelIdentifier>();
  static final UID = amplify_core.QueryField(fieldName: "uid");
  static final USERNAME = amplify_core.QueryField(fieldName: "userName");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final ORGANIZATIONNAME = amplify_core.QueryField(fieldName: "organizationName");
  static final ORGANIZATIONID = amplify_core.QueryField(fieldName: "organizationId");
  static final ADMINID = amplify_core.QueryField(fieldName: "adminId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "userInfo";
    modelSchemaDefinition.pluralName = "userInfos";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["uid"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.UID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.IMAGEURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.ORGANIZATIONNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.ORGANIZATIONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.ADMINID,
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

class _userInfoModelType extends amplify_core.ModelType<userInfo> {
  const _userInfoModelType();
  
  @override
  userInfo fromJson(Map<String, dynamic> jsonData) {
    return userInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'userInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [userInfo] in your schema.
 */
class userInfoModelIdentifier implements amplify_core.ModelIdentifier<userInfo> {
  final String uid;

  /** Create an instance of userInfoModelIdentifier using [uid] the primary key. */
  const userInfoModelIdentifier({
    required this.uid});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'uid': uid
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'userInfoModelIdentifier(uid: $uid)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is userInfoModelIdentifier &&
      uid == other.uid;
  }
  
  @override
  int get hashCode =>
    uid.hashCode;
}