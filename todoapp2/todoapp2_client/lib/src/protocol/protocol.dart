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
import 'category.dart' as _i2;
import 'example.dart' as _i3;
import 'response.dart' as _i4;
import 'task.dart' as _i5;
import 'package:todoapp2_client/src/protocol/category.dart' as _i6;
import 'package:todoapp2_client/src/protocol/task.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'category.dart';
export 'example.dart';
export 'response.dart';
export 'task.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Category) {
      return _i2.Category.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.Response) {
      return _i4.Response.fromJson(data) as T;
    }
    if (t == _i5.Task) {
      return _i5.Task.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Category?>()) {
      return (data != null ? _i2.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Response?>()) {
      return (data != null ? _i4.Response.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Task?>()) {
      return (data != null ? _i5.Task.fromJson(data) : null) as T;
    }
    if (t == List<_i6.Category>) {
      return (data as List).map((e) => deserialize<_i6.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Task>) {
      return (data as List).map((e) => deserialize<_i7.Task>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Category) {
      return 'Category';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Response) {
      return 'Response';
    }
    if (data is _i5.Task) {
      return 'Task';
    }
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i2.Category>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (dataClassName == 'Response') {
      return deserialize<_i4.Response>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i5.Task>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
