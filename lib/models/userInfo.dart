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


/** This is an auto generated class representing the userInfo type in your schema. */
class userInfo extends amplify_core.Model {
  static const classType = const _userInfoModelType();
  final String? _userUid;
  final String? _userName;
  final String? _email;
  final String? _imageUrl;
  final bool? _isadmin;
  final String? _organizationId;
  final String? _superAdminId;
  final String? _requestStatus;
  final String? _teamId;
  final bool? _isteamLeader;
  final List<String>? _dealIds;
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
        userUid: _userUid!
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
  
  String get userUid {
    try {
      return _userUid!;
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
  
  bool? get isadmin {
    return _isadmin;
  }
  
  String? get organizationId {
    return _organizationId;
  }
  
  String? get superAdminId {
    return _superAdminId;
  }
  
  String? get requestStatus {
    return _requestStatus;
  }
  
  String? get teamId {
    return _teamId;
  }
  
  bool? get isteamLeader {
    return _isteamLeader;
  }
  
  List<String>? get dealIds {
    return _dealIds;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const userInfo._internal({required userUid, required userName, required email, required imageUrl, isadmin, organizationId, superAdminId, requestStatus, teamId, isteamLeader, dealIds, createdAt, updatedAt}): _userUid = userUid, _userName = userName, _email = email, _imageUrl = imageUrl, _isadmin = isadmin, _organizationId = organizationId, _superAdminId = superAdminId, _requestStatus = requestStatus, _teamId = teamId, _isteamLeader = isteamLeader, _dealIds = dealIds, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory userInfo({required String userUid, required String userName, required String email, required String imageUrl, bool? isadmin, String? organizationId, String? superAdminId, String? requestStatus, String? teamId, bool? isteamLeader, List<String>? dealIds}) {
    return userInfo._internal(
      userUid: userUid,
      userName: userName,
      email: email,
      imageUrl: imageUrl,
      isadmin: isadmin,
      organizationId: organizationId,
      superAdminId: superAdminId,
      requestStatus: requestStatus,
      teamId: teamId,
      isteamLeader: isteamLeader,
      dealIds: dealIds != null ? List<String>.unmodifiable(dealIds) : dealIds);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is userInfo &&
      _userUid == other._userUid &&
      _userName == other._userName &&
      _email == other._email &&
      _imageUrl == other._imageUrl &&
      _isadmin == other._isadmin &&
      _organizationId == other._organizationId &&
      _superAdminId == other._superAdminId &&
      _requestStatus == other._requestStatus &&
      _teamId == other._teamId &&
      _isteamLeader == other._isteamLeader &&
      DeepCollectionEquality().equals(_dealIds, other._dealIds);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("userInfo {");
    buffer.write("userUid=" + "$_userUid" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("isadmin=" + (_isadmin != null ? _isadmin!.toString() : "null") + ", ");
    buffer.write("organizationId=" + "$_organizationId" + ", ");
    buffer.write("superAdminId=" + "$_superAdminId" + ", ");
    buffer.write("requestStatus=" + "$_requestStatus" + ", ");
    buffer.write("teamId=" + "$_teamId" + ", ");
    buffer.write("isteamLeader=" + (_isteamLeader != null ? _isteamLeader!.toString() : "null") + ", ");
    buffer.write("dealIds=" + (_dealIds != null ? _dealIds!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  userInfo copyWith({String? userName, String? email, String? imageUrl, bool? isadmin, String? organizationId, String? superAdminId, String? requestStatus, String? teamId, bool? isteamLeader, List<String>? dealIds}) {
    return userInfo._internal(
      userUid: userUid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      isadmin: isadmin ?? this.isadmin,
      organizationId: organizationId ?? this.organizationId,
      superAdminId: superAdminId ?? this.superAdminId,
      requestStatus: requestStatus ?? this.requestStatus,
      teamId: teamId ?? this.teamId,
      isteamLeader: isteamLeader ?? this.isteamLeader,
      dealIds: dealIds ?? this.dealIds);
  }
  
  userInfo copyWithModelFieldValues({
    ModelFieldValue<String>? userName,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? imageUrl,
    ModelFieldValue<bool?>? isadmin,
    ModelFieldValue<String?>? organizationId,
    ModelFieldValue<String?>? superAdminId,
    ModelFieldValue<String?>? requestStatus,
    ModelFieldValue<String?>? teamId,
    ModelFieldValue<bool?>? isteamLeader,
    ModelFieldValue<List<String>?>? dealIds
  }) {
    return userInfo._internal(
      userUid: userUid,
      userName: userName == null ? this.userName : userName.value,
      email: email == null ? this.email : email.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      isadmin: isadmin == null ? this.isadmin : isadmin.value,
      organizationId: organizationId == null ? this.organizationId : organizationId.value,
      superAdminId: superAdminId == null ? this.superAdminId : superAdminId.value,
      requestStatus: requestStatus == null ? this.requestStatus : requestStatus.value,
      teamId: teamId == null ? this.teamId : teamId.value,
      isteamLeader: isteamLeader == null ? this.isteamLeader : isteamLeader.value,
      dealIds: dealIds == null ? this.dealIds : dealIds.value
    );
  }
  
  userInfo.fromJson(Map<String, dynamic> json)  
    : _userUid = json['userUid'],
      _userName = json['userName'],
      _email = json['email'],
      _imageUrl = json['imageUrl'],
      _isadmin = json['isadmin'],
      _organizationId = json['organizationId'],
      _superAdminId = json['superAdminId'],
      _requestStatus = json['requestStatus'],
      _teamId = json['teamId'],
      _isteamLeader = json['isteamLeader'],
      _dealIds = json['dealIds']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'userUid': _userUid, 'userName': _userName, 'email': _email, 'imageUrl': _imageUrl, 'isadmin': _isadmin, 'organizationId': _organizationId, 'superAdminId': _superAdminId, 'requestStatus': _requestStatus, 'teamId': _teamId, 'isteamLeader': _isteamLeader, 'dealIds': _dealIds, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'userUid': _userUid,
    'userName': _userName,
    'email': _email,
    'imageUrl': _imageUrl,
    'isadmin': _isadmin,
    'organizationId': _organizationId,
    'superAdminId': _superAdminId,
    'requestStatus': _requestStatus,
    'teamId': _teamId,
    'isteamLeader': _isteamLeader,
    'dealIds': _dealIds,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<userInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<userInfoModelIdentifier>();
  static final USERUID = amplify_core.QueryField(fieldName: "userUid");
  static final USERNAME = amplify_core.QueryField(fieldName: "userName");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final ISADMIN = amplify_core.QueryField(fieldName: "isadmin");
  static final ORGANIZATIONID = amplify_core.QueryField(fieldName: "organizationId");
  static final SUPERADMINID = amplify_core.QueryField(fieldName: "superAdminId");
  static final REQUESTSTATUS = amplify_core.QueryField(fieldName: "requestStatus");
  static final TEAMID = amplify_core.QueryField(fieldName: "teamId");
  static final ISTEAMLEADER = amplify_core.QueryField(fieldName: "isteamLeader");
  static final DEALIDS = amplify_core.QueryField(fieldName: "dealIds");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "userInfo";
    modelSchemaDefinition.pluralName = "userInfos";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["userUid"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.USERUID,
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
      key: userInfo.ISADMIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.ORGANIZATIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.SUPERADMINID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.REQUESTSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.TEAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.ISTEAMLEADER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: userInfo.DEALIDS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
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
  final String userUid;

  /** Create an instance of userInfoModelIdentifier using [userUid] the primary key. */
  const userInfoModelIdentifier({
    required this.userUid});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'userUid': userUid
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'userInfoModelIdentifier(userUid: $userUid)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is userInfoModelIdentifier &&
      userUid == other.userUid;
  }
  
  @override
  int get hashCode =>
    userUid.hashCode;
}