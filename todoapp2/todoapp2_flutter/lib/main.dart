import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todoapp2_flutter/src/serverpod_client.dart';
import 'package:todoapp2_flutter/core/routes/app_routes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

var client = Client(
  'http://$localhost:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();
final SessionManager sessionManager =
    SessionManager(caller: client.modules.auth);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServerpodClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes(client, sessionManager).appPages,
      enableLog: true,
      defaultTransition: Transition.noTransition,
    );
  }
}
