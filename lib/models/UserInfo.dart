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


/** This is an auto generated class representing the UserInfo type in your schema. */
class UserInfo extends amplify_core.Model {
  static const classType = const _UserInfoModelType();
  final String id;
  final String? _uid;
  final String? _username;
  final String? _email;
  final String? _imageUrl;
  final String? _acceleratorName;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserInfoModelIdentifier get modelIdentifier {
      return UserInfoModelIdentifier(
        id: id
      );
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
  
  String get username {
    try {
      return _username!;
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
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  String get acceleratorName {
    try {
      return _acceleratorName!;
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
  
  const UserInfo._internal({required this.id, required uid, required username, required email, imageUrl, required acceleratorName, createdAt, updatedAt}): _uid = uid, _username = username, _email = email, _imageUrl = imageUrl, _acceleratorName = acceleratorName, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserInfo({String? id, required String uid, required String username, required String email, String? imageUrl, required String acceleratorName}) {
    return UserInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      uid: uid,
      username: username,
      email: email,
      imageUrl: imageUrl,
      acceleratorName: acceleratorName);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfo &&
      id == other.id &&
      _uid == other._uid &&
      _username == other._username &&
      _email == other._email &&
      _imageUrl == other._imageUrl &&
      _acceleratorName == other._acceleratorName;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("acceleratorName=" + "$_acceleratorName" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserInfo copyWith({String? uid, String? username, String? email, String? imageUrl, String? acceleratorName}) {
    return UserInfo._internal(
      id: id,
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      acceleratorName: acceleratorName ?? this.acceleratorName);
  }
  
  UserInfo copyWithModelFieldValues({
    ModelFieldValue<String>? uid,
    ModelFieldValue<String>? username,
    ModelFieldValue<String>? email,
    ModelFieldValue<String?>? imageUrl,
    ModelFieldValue<String>? acceleratorName
  }) {
    return UserInfo._internal(
      id: id,
      uid: uid == null ? this.uid : uid.value,
      username: username == null ? this.username : username.value,
      email: email == null ? this.email : email.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      acceleratorName: acceleratorName == null ? this.acceleratorName : acceleratorName.value
    );
  }
  
  UserInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uid = json['uid'],
      _username = json['username'],
      _email = json['email'],
      _imageUrl = json['imageUrl'],
      _acceleratorName = json['acceleratorName'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uid': _uid, 'username': _username, 'email': _email, 'imageUrl': _imageUrl, 'acceleratorName': _acceleratorName, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'uid': _uid,
    'username': _username,
    'email': _email,
    'imageUrl': _imageUrl,
    'acceleratorName': _acceleratorName,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final UID = amplify_core.QueryField(fieldName: "uid");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final ACCELERATORNAME = amplify_core.QueryField(fieldName: "acceleratorName");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserInfo";
    modelSchemaDefinition.pluralName = "UserInfos";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserInfo.UID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserInfo.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserInfo.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserInfo.IMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserInfo.ACCELERATORNAME,
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

class _UserInfoModelType extends amplify_core.ModelType<UserInfo> {
  const _UserInfoModelType();
  
  @override
  UserInfo fromJson(Map<String, dynamic> jsonData) {
    return UserInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserInfo] in your schema.
 */
class UserInfoModelIdentifier implements amplify_core.ModelIdentifier<UserInfo> {
  final String id;

  /** Create an instance of UserInfoModelIdentifier using [id] the primary key. */
  const UserInfoModelIdentifier({
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
  String toString() => 'UserInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}