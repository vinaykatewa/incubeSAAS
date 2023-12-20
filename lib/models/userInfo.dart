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
  final String? _acceleratorName;
  final String? _userName;
  final String? _email;
  final String? _imageUrl;
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
  
  String? get userName {
    return _userName;
  }
  
  String? get email {
    return _email;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const userInfo._internal({required uid, required acceleratorName, userName, email, imageUrl, createdAt, updatedAt}): _uid = uid, _acceleratorName = acceleratorName, _userName = userName, _email = email, _imageUrl = imageUrl, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory userInfo({required String uid, required String acceleratorName, String? userName, String? email, String? imageUrl}) {
    return userInfo._internal(
      uid: uid,
      acceleratorName: acceleratorName,
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
    return other is userInfo &&
      _uid == other._uid &&
      _acceleratorName == other._acceleratorName &&
      _userName == other._userName &&
      _email == other._email &&
      _imageUrl == other._imageUrl;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("userInfo {");
    buffer.write("uid=" + "$_uid" + ", ");
    buffer.write("acceleratorName=" + "$_acceleratorName" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  userInfo copyWith({String? acceleratorName, String? userName, String? email, String? imageUrl}) {
    return userInfo._internal(
      uid: uid,
      acceleratorName: acceleratorName ?? this.acceleratorName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl);
  }
  
  userInfo copyWithModelFieldValues({
    ModelFieldValue<String>? acceleratorName,
    ModelFieldValue<String?>? userName,
    ModelFieldValue<String?>? email,
    ModelFieldValue<String?>? imageUrl
  }) {
    return userInfo._internal(
      uid: uid,
      acceleratorName: acceleratorName == null ? this.acceleratorName : acceleratorName.value,
      userName: userName == null ? this.userName : userName.value,
      email: email == null ? this.email : email.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value
    );
  }
  
  userInfo.fromJson(Map<String, dynamic> json)  
    : _uid = json['uid'],
      _acceleratorName = json['acceleratorName'],
      _userName = json['userName'],
      _email = json['email'],
      _imageUrl = json['imageUrl'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'uid': _uid, 'acceleratorName': _acceleratorName, 'userName': _userName, 'email': _email, 'imageUrl': _imageUrl, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'uid': _uid,
    'acceleratorName': _acceleratorName,
    'userName': _userName,
    'email': _email,
    'imageUrl': _imageUrl,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<userInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<userInfoModelIdentifier>();
  static final UID = amplify_core.QueryField(fieldName: "uid");
  static final ACCELERATORNAME = amplify_core.QueryField(fieldName: "acceleratorName");
  static final USERNAME = amplify_core.QueryField(fieldName: "userName");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
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
      key: userInfo.ACCELERATORNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.USERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.IMAGEURL,
      isRequired: false,
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