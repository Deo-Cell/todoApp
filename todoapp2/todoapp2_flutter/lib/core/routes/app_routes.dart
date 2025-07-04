import 'package:get/get.dart';
import '../bindings/category_binding.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/home/home_page.dart';
import 'package:todoapp2_flutter/core/routes/rootview.dart';
import 'package:todoapp2_flutter/core/bindings/home_binding.dart';
import 'package:todoapp2_flutter/core/bindings/login_binding.dart';
import 'package:todoapp2_flutter/core/bindings/tasks_bindings.dart';
import 'package:todoapp2_flutter/core/bindings/addtask_binding.dart';
import 'package:todoapp2_flutter/core/bindings/podomoro_binding.dart';
import 'package:todoapp2_flutter/core/bindings/settings_binding.dart';
import 'package:todoapp2_flutter/core/bindings/register_bindings.dart';
import 'package:todoapp2_flutter/core/bindings/verification_bindings.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todoapp2_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:todoapp2_flutter/features/auth/presentation/pages/register_page.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/pages/tasks_page.dart';
import 'package:todoapp2_flutter/features/pomodoro/presentation/page/podomoro_page.dart';
import 'package:todoapp2_flutter/features/settings/presentation/page/settings_page.dart';
import 'package:todoapp2_flutter/features/auth/presentation/pages/confirmation_page.dart';
import 'package:todoapp2_flutter/features/category/presentation/pages/category_page.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/pages/add_task_page.dart';
import 'package:todoapp2_flutter/features/splashscreen/presentation/splashscreen_page.dart';

class AppRoutes {
  final Client client;
  final SessionManager sessionManager;
  late final List<GetPage> appPages;

  AppRoutes(this.client, this.sessionManager) {
    appPages = [
      GetPage(
        name: '/',
        page: () => const RootView(),
        participatesInRootNavigator: true,
        children: [
          GetPage(
            name: '/splash',
            page: () => const SplashScreenPage(),
          ),
          GetPage(
            name: '/login',
            page: () => const LoginPage(),
            binding:
                LoginBinding(client: client, sessionManager: sessionManager),
                transition: Transition.rightToLeft,
          ),
          GetPage(
            name: '/signup',
            page: () => const RegisterPage(),
            binding:
                RegisterBinding(client: client, sessionManager: sessionManager),
                transition: Transition.rightToLeft,
                //transitionDuration: const Duration(seconds: 2),
                opaque: true,
          ),
           GetPage(
            name: '/verify',
            page: () =>  ConfirmationPage(),
            binding:
              ConfirmationBinding(client: client, sessionManager: sessionManager),
              transition: Transition.rightToLeft,
                //transitionDuration: const Duration(seconds: 2),
                opaque: true,
          ),
          GetPage(
              name: '/addtask',
              page: () => const AddTaskPage(),
              binding: AddtaskBinding(),
              transition: Transition.downToUp,
              //transitionDuration: const Duration(seconds: 2),
              opaque: true,
              ),
              
          GetPage(
              name: '/category',
              page: () => const CategoryPage(),
              binding: CategoryBinding(),
              transition: Transition.downToUp,
              //transitionDuration: const Duration(seconds: 2),
              opaque: true,
              ),
          GetPage(
            name: '/home',
            page: () => Homepage(),
            binding: HomeBinding(),
            children: [
              GetPage(
                name: '/tasks',
                page: () => const TasksPage(),
                binding: TaskBinding(client),
                opaque: true,
              ),
              GetPage(
                name: '/podomoro',
                page: () => PomodoroPage(),
                binding: PodomoroBinding(),
              ),
              GetPage(
                name: '/settings',
                page: () => const SettingsPage(),
                binding: SettingsBinding(),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
