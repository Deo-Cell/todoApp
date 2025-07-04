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
import 'dart:async' as _i2;
import 'package:todoapp2_client/src/protocol/category.dart' as _i3;
import 'package:todoapp2_client/src/protocol/response.dart' as _i4;
import 'package:todoapp2_client/src/protocol/task.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<List<_i3.Category>> getCategories() =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'getCategories',
        {},
      );

  _i2.Future<_i3.Category?> getCategoryById(int id) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'getCategoryById',
        {'id': id},
      );

  _i2.Future<_i4.Response> addCategory(_i3.Category newCategory) =>
      caller.callServerEndpoint<_i4.Response>(
        'category',
        'addCategory',
        {'newCategory': newCategory},
      );

  _i2.Future<bool> deleteCategoryById(int categoryId) =>
      caller.callServerEndpoint<bool>(
        'category',
        'deleteCategoryById',
        {'categoryId': categoryId},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTask extends _i1.EndpointRef {
  EndpointTask(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'task';

  _i2.Future<List<_i5.Task>> getTasks() =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getTasks',
        {},
      );

  _i2.Future<List<_i5.Task>> getTasksCompleted(DateTime date) =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getTasksCompleted',
        {'date': date},
      );

  _i2.Future<List<_i5.Task>> getTasksPended(DateTime date) =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getTasksPended',
        {'date': date},
      );

  _i2.Future<List<_i5.Task>> getMorningTasks(DateTime now) =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getMorningTasks',
        {'now': now},
      );

  _i2.Future<List<_i5.Task>> getEveningTasks(DateTime now) =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getEveningTasks',
        {'now': now},
      );

  _i2.Future<List<_i5.Task>> getNoonTasks(DateTime now) =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getNoonTasks',
        {'now': now},
      );

  _i2.Future<bool> addTask(_i5.Task newTask) => caller.callServerEndpoint<bool>(
        'task',
        'addTask',
        {'newTask': newTask},
      );

  _i2.Future<_i5.Task?> getTaskById(int id) =>
      caller.callServerEndpoint<_i5.Task?>(
        'task',
        'getTaskById',
        {'id': id},
      );

  _i2.Future<List<_i5.Task>> getTasksByCategory(int categoryId) =>
      caller.callServerEndpoint<List<_i5.Task>>(
        'task',
        'getTasksByCategory',
        {'categoryId': categoryId},
      );

  _i2.Future<bool> updateTask(_i5.Task updatedTask) =>
      caller.callServerEndpoint<bool>(
        'task',
        'updateTask',
        {'updatedTask': updatedTask},
      );

  _i2.Future<bool> deleteTask(int id) => caller.callServerEndpoint<bool>(
        'task',
        'deleteTask',
        {'id': id},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    category = EndpointCategory(this);
    example = EndpointExample(this);
    task = EndpointTask(this);
    modules = Modules(this);
  }

  late final EndpointCategory category;

  late final EndpointExample example;

  late final EndpointTask task;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'example': example,
        'task': task,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
