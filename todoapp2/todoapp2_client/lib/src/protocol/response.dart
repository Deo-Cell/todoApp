/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Response implements _i1.SerializableModel {
  Response._({
    this.id,
    required this.success,
    required this.message,
  });

  factory Response({
    int? id,
    required bool success,
    required String message,
  }) = _ResponseImpl;

  factory Response.fromJson(Map<String, dynamic> jsonSerialization) {
    return Response(
      id: jsonSerialization['id'] as int?,
      success: jsonSerialization['success'] as bool,
      message: jsonSerialization['message'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  bool success;

  String message;

  Response copyWith({
    int? id,
    bool? success,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'success': success,
      'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResponseImpl extends Response {
  _ResponseImpl({
    int? id,
    required bool success,
    required String message,
  }) : super._(
          id: id,
          success: success,
          message: message,
        );

  @override
  Response copyWith({
    Object? id = _Undefined,
    bool? success,
    String? message,
  }) {
    return Response(
      id: id is int? ? id : this.id,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }
}
