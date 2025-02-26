import 'package:appscrip_task_management/core/local_storage/app_storage_pod.dart';
import 'package:appscrip_task_management/core/router/router.gr.dart';
import 'package:appscrip_task_management/core/router/router_pod.dart';
import 'package:appscrip_task_management/data/service/login_db/login_db_service_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOutBtn extends ConsumerWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final appStorage = ref.watch(appStorageProvider);
        final box = appStorage.appBox;
        await box?.clear();
        await ref.read(loginDbProvider).deleteLoginTokend();
        ref.read(autorouterProvider).replaceAll([const LoginRoute()]);
      },
      child: Icon(
        Icons.logout_outlined,
      ),
    );
  }
}
