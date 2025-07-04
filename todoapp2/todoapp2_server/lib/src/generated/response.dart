/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Response implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = ResponseTable();

  static const db = ResponseRepository._();

  @override
  int? id;

  bool success;

  String message;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'success': success,
      'message': message,
    };
  }

  static ResponseInclude include() {
    return ResponseInclude._();
  }

  static ResponseIncludeList includeList({
    _i1.WhereExpressionBuilder<ResponseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ResponseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ResponseTable>? orderByList,
    ResponseInclude? include,
  }) {
    return ResponseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Response.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Response.t),
      include: include,
    );
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

class ResponseTable extends _i1.Table {
  ResponseTable({super.tableRelation}) : super(tableName: 'response') {
    success = _i1.ColumnBool(
      'success',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
  }

  late final _i1.ColumnBool success;

  late final _i1.ColumnString message;

  @override
  List<_i1.Column> get columns => [
        id,
        success,
        message,
      ];
}

class ResponseInclude extends _i1.IncludeObject {
  ResponseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Response.t;
}

class ResponseIncludeList extends _i1.IncludeList {
  ResponseIncludeList._({
    _i1.WhereExpressionBuilder<ResponseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Response.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Response.t;
}

class ResponseRepository {
  const ResponseRepository._();

  Future<List<Response>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ResponseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ResponseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ResponseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Response>(
      where: where?.call(Response.t),
      orderBy: orderBy?.call(Response.t),
      orderByList: orderByList?.call(Response.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Response?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ResponseTable>? where,
    int? offset,
    _i1.OrderByBuilder<ResponseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ResponseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Response>(
      where: where?.call(Response.t),
      orderBy: orderBy?.call(Response.t),
      orderByList: orderByList?.call(Response.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Response?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Response>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Response>> insert(
    _i1.Session session,
    List<Response> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Response>(
      rows,
      transaction: transaction,
    );
  }

  Future<Response> insertRow(
    _i1.Session session,
    Response row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Response>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Response>> update(
    _i1.Session session,
    List<Response> rows, {
    _i1.ColumnSelections<ResponseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Response>(
      rows,
      columns: columns?.call(Response.t),
      transaction: transaction,
    );
  }

  Future<Response> updateRow(
    _i1.Session session,
    Response row, {
    _i1.ColumnSelections<ResponseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Response>(
      row,
      columns: columns?.call(Response.t),
      transaction: transaction,
    );
  }

  Future<List<Response>> delete(
    _i1.Session session,
    List<Response> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Response>(
      rows,
      transaction: transaction,
    );
  }

  Future<Response> deleteRow(
    _i1.Session session,
    Response row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Response>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Response>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ResponseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Response>(
      where: where(Response.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ResponseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Response>(
      where: where?.call(Response.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
