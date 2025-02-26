import 'package:appscrip_task_management/const/colors/app_colors.dart';
import 'package:appscrip_task_management/const/resource.dart';
import 'package:appscrip_task_management/core/router/router.gr.dart';
import 'package:appscrip_task_management/features/login/const/login_keys.dart';
import 'package:appscrip_task_management/features/login/controller/login_pod.dart';
import 'package:appscrip_task_management/features/login/state/login_state.dart';
import 'package:appscrip_task_management/features/login/view/widgets/login_button.dart';
import 'package:appscrip_task_management/shared/utilities/utilites.dart';
import 'package:appscrip_task_management/shared/widget/animated_widget.dart';
import 'package:appscrip_task_management/shared/widget/custom_text_formfield.dart';
import 'package:appscrip_task_management/shared/widget/primary_action_button.dart';
import 'package:appscrip_task_management/shared/widget/text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with TickerProviderStateMixin {
  final _loginFormKey = GlobalKey<FormBuilderState>();

  late final AnimationController _controller;

  // Group animations by type for better organization
  late final Map<String, Animation<double>> _fadeAnimations;
  late final Map<String, Animation<Offset>> _slideAnimations;

  // Track form field controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Single place to define animation timing intervals
  final _animationIntervals = {
    'image': const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
    'title': const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
    'form': const Interval(0.3, 0.9, curve: Curves.easeOutCubic),
    'button': const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
  };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200), // Slightly faster animation
      vsync: this,
    );

    // Create all animations at once with a more efficient approach
    final curves = _animationIntervals.map(
        (key, interval) => MapEntry(key, CurvedAnimation(parent: _controller, curve: interval)));

    // Setup fade animations
    _fadeAnimations = curves
        .map((key, curve) => MapEntry(key, Tween<double>(begin: 0.0, end: 1.0).animate(curve)));

    // Setup slide animations with consistent pattern
    _slideAnimations = curves.map((key, curve) => MapEntry(
        key,
        Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(curve)));

    // Start animations when screen loads
    _controller.forward();
  }

  @override
  void dispose() {
    // Clean up all controllers
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles the login process when the user submits the form.
  void _handleLogin() {
    // Validate the form
    if (_loginFormKey.currentState?.validate() ?? false) {
      HapticFeedback.lightImpact(); // Provide subtle feedback on button press
      Feedback.forTap(context);

      // Extract values from form fields
      final fields = _loginFormKey.currentState!.fields;
      final email = fields[LoginKeys.email]!.value as String;
      final password = fields[LoginKeys.password]!.value as String;

      // Trigger the login process via Riverpod provider
      ref.read(loginProvider.notifier).loginUser(
            email: email,
            passWord: password,
            onLoginVerified: () {
              // Show success toast and navigate to home screen on successful login
              context.showToast(msg: 'Success', bgColor: AppColors.kSuccessColor.withOpacity(0.8));
              context.router.replaceAll([const HomeRoute()]);
            },
          );
    } else {
      // Show error message if validation fails
      Utilities.flushBarErrorMessage(message: "Not validated", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen for login state changes and show error messages if login fails
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next.value is NotVerifiedState) {
          Utilities.flushBarErrorMessage(
              message: 'Unable to verify at this time. Please try later', context: context);
        }
      },
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.appWhite,
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated logo/image
                CustomAnimatedWidget(
                  fadeAnimation: _fadeAnimations['image']!,
                  slideAnimation: _slideAnimations['image']!,
                  child: Center(
                    child: Image.asset(
                      R.ASSETS_ILLUSTRATION_DASH_LOGO_PNG,
                      height: MediaQuery.of(context).size.height * 0.25, // Slightly smaller
                    ),
                  ),
                ),
                20.heightBox,
                // Animated title section
                CustomAnimatedWidget(
                  fadeAnimation: _fadeAnimations['title']!,
                  slideAnimation: _slideAnimations['title']!,
                  child: Column(
                    children: [
                      AppText(
                        text: 'Welcome back dear.',
                        fontWeight: FontWeight.w600,
                        fontSize: context.textTheme.titleLarge!.fontSize,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            text: 'Login ',
                            fontSize: context.textTheme.titleMedium!.fontSize,
                          ),
                          AppText(
                            text: 'to Continue.',
                            color: AppColors.grey600,
                            fontSize: context.textTheme.labelLarge!.fontSize,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                40.heightBox,

                /// **Login Form**
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FormBuilder(
                      key: _loginFormKey,
                      child: // Animated form fields
                          CustomAnimatedWidget(
                        fadeAnimation: _fadeAnimations['form']!,
                        slideAnimation: _slideAnimations['form']!,
                        child: Column(
                          children: [
                            /// **Username Field**
                            CustomTextFormField(
                              labelText: 'Email',
                              hintText: 'Email',
                              name: LoginKeys.email,
                              keyboardType: TextInputType.emailAddress,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(errorText: 'Enter Username'),
                              ]),
                              prefixIcon: const Icon(
                                Icons.fingerprint_rounded,
                                color: AppColors.violet,
                              ),
                            ),
                            20.heightBox,

                            /// **Password Field**
                            CustomTextFormField(
                              textInputAction: TextInputAction.done,
                              labelText: 'Password',
                              hintText: 'Password',
                              name: LoginKeys.password,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(errorText: 'PassWord Required'),
                              ]),
                              prefixIcon: Icon(
                                Icons.lock_person_rounded,
                                color: AppColors.violet,
                              ),
                            ),
                            10.heightBox,
                          ],
                        ).pOnly(
                          top: 10,
                          left: 20,
                          right: 20,
                        ),
                      ),
                    ),
                    20.heightBox,

                    /// **Login Button**
                    CustomAnimatedWidget(
                      fadeAnimation: _fadeAnimations['button']!,
                      slideAnimation: _slideAnimations['button']!,
                      child: LoginButton(onLogin: _handleLogin).pOnly(left: 24, right: 24),
                    ),
                  ],
                ),
                20.heightBox,
                AppText(
                  text: 'Or',
                  color: AppColors.grey600,
                ),
                20.heightBox,
                PrimaryActionButton(
                  color: AppColors.orangeYellow,
                  labelText: 'Register',
                  onPressed: () {},
                ).pSymmetric(h: 24)
              ],
            ).p12(),
          ],
        ),
      ),
    );
  }
}
