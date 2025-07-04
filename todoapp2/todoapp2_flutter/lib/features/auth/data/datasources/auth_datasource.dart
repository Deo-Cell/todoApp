import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/exceptions.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todoapp2_flutter/features/auth/data/datasources/models/user_model.dart';


abstract interface class AuthDataSource {
  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<bool> registerWithEmailPassword(
      {required String email, required String password, required String username});
  Future<UserModel> codeVerification(
      {required String email, required String code});
  Future<void> logout();
  UserModel? currentUser();
}

class AuthDataSourceImpl implements AuthDataSource {
  final Client client;
  final SessionManager sessionManager;
  const AuthDataSourceImpl(
      {required this.client, required this.sessionManager});

  @override
  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result =
          await client.modules.auth.email.authenticate(email, password);
      if (!result.success) {
        throw ServerException(
            message: result.failReason?.toString() ?? "Could not login");
      }
      if (result.userInfo == null) {
        throw ServerException(message: "User not found");
      }
      if (result.keyId == null || result.key == null) {
        throw ServerException(message: "Key/keyId not found");
      }
      await sessionManager.registerSignedInUser(
          result.userInfo!, result.keyId!, result.key!);
      return UserModel(
          id: result.userInfo!.id!,
          email: result.userInfo!.email!,
          username: result.userInfo!.userName!);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await sessionManager.signOut();
    } catch (e) {
      ServerException(message: e.toString());
    }
  }

  

  @override
  Future<UserModel> codeVerification(
      {required String email, required String code}) async {
    try {
      final result = await client.modules.auth.email.createAccount(email, code);
      if (result == null) {
        ServerException(message: "Uer was null");
      }
      if (result!.email == null || result.id == null) {
        throw ServerException(message: "Email or id was null");
      }
      return UserModel(
          id: result.id!, email: result.email!, username: result.userName!);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  UserModel? currentUser() {
    final user = sessionManager.signedInUser;
    if (user != null && user.id != null && user.email != null) {
      return UserModel(
          id: user.id!, email: user.email!, username: user.userName!);
    }
    return null;
  }
  
  @override
  Future<bool> registerWithEmailPassword({required String email, required String password, required String username}) async {
     try {
      final result = await client.modules.auth.email.createAccountRequest(
          username, email, password);
      if (result == false) {
        ServerException(message: "Could not create account");
      }
      return result;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
