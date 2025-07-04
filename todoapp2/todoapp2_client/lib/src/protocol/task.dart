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

abstract class Task implements _i1.SerializableModel {
  Task._({
    this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.createdAt,
    this.categoryId,
    required this.deadline,
    this.reminder,
    required this.userId,
  });

  factory Task({
    int? id,
    required String title,
    required String description,
    required bool isCompleted,
    DateTime? createdAt,
    int? categoryId,
    required DateTime deadline,
    DateTime? reminder,
    required int userId,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      isCompleted: jsonSerialization['isCompleted'] as bool,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      categoryId: jsonSerialization['categoryId'] as int?,
      deadline:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      reminder: jsonSerialization['reminder'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['reminder']),
      userId: jsonSerialization['userId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  bool isCompleted;

  DateTime? createdAt;

  int? categoryId;

  DateTime deadline;

  DateTime? reminder;

  int userId;

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    int? categoryId,
    DateTime? deadline,
    DateTime? reminder,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (categoryId != null) 'categoryId': categoryId,
      'deadline': deadline.toJson(),
      if (reminder != null) 'reminder': reminder?.toJson(),
      'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskImpl extends Task {
  _TaskImpl({
    int? id,
    required String title,
    required String description,
    required bool isCompleted,
    DateTime? createdAt,
    int? categoryId,
    required DateTime deadline,
    DateTime? reminder,
    required int userId,
  }) : super._(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          createdAt: createdAt,
          categoryId: categoryId,
          deadline: deadline,
          reminder: reminder,
          userId: userId,
        );

  @override
  Task copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    bool? isCompleted,
    Object? createdAt = _Undefined,
    Object? categoryId = _Undefined,
    DateTime? deadline,
    Object? reminder = _Undefined,
    int? userId,
  }) {
    return Task(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      categoryId: categoryId is int? ? categoryId : this.categoryId,
      deadline: deadline ?? this.deadline,
      reminder: reminder is DateTime? ? reminder : this.reminder,
      userId: userId ?? this.userId,
    );
  }
}
