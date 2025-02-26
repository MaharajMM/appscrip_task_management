import 'package:appscrip_task_management/const/colors/app_colors.dart';
import 'package:appscrip_task_management/features/login/controller/login_pod.dart';
import 'package:appscrip_task_management/features/login/state/login_state.dart';
import 'package:appscrip_task_management/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:appscrip_task_management/shared/widget/primary_action_button.dart';
import 'package:appscrip_task_management/shared/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginButton extends ConsumerWidget {
  final VoidCallback onLogin;
  const LoginButton({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStateAsync = ref.watch(loginProvider);
    return loginStateAsync.easyWhen(
      data: (loginState) {
        return switch (loginState) {
          InitialLoginState() => PrimaryActionButton(
              labelText: 'Login',
              onPressed: onLogin,
            ),
          VerifyingLoginState() => PrimaryActionButton(
              isLoading: true,
              labelText: 'Verifying',
              onPressed: () {},
            ),
          VerifiedState() => PrimaryActionButton(
              labelText: 'Verified Login',
              onPressed: () {},
            ),
          NotVerifiedState() => PrimaryActionButton(
              labelText: 'Unable to verify',
              onPressed: onLogin,
            ),
          LoginErrorState() => Column(
              children: [
                AppText(
                  text: loginState.message,
                  color: AppColors.kErrorColor,
                ),
                8.heightBox,
                PrimaryActionButton(
                  labelText: 'Retry',
                  onPressed: onLogin,
                ),
              ],
            ),
        };
      },
    );
  }
}
