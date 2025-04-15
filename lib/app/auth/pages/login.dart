import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../display/display.dart';
import '../../../utils/utils.dart';
import '../auth.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;

  void _togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ResponsiveWidgetFormLayout(
        buildPageContent: (BuildContext context, Color? color) => SafeArea(
          child: Container(
            padding: const EdgeInsets.all(Constants.SPACING * 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "ZuriCycle".toUpperCase(),
                      style: TextStyle(
                        fontSize: theme.textTheme.displayLarge?.fontSize,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Hello, Welcome back 👋",
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 10),
                  FormBuilder(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.SPACING),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'email',
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "e.g abc@gmail.com",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'password',
                            obscureText: _hidePassword,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              prefixIcon: const Icon(Icons.lock),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: _togglePassword,
                                icon: Icon(
                                  _hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          const SizedBox(height: 20),

                          /// **Login Button with Loading State**
                          Center(
                            child: OutlinedButton(
                              onPressed: authState is AsyncLoading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState
                                              ?.saveAndValidate() ??
                                          false) {
                                        final email =
                                            _formKey.currentState?.value['email'];
                                        final password = _formKey
                                            .currentState?.value['password'];

                                        final contextBeforeAwait =
                                            context; // Store context before async call

                                        final result = await ref
                                            .read(authNotifierProvider.notifier)
                                            .login(email, password);

                                        if (contextBeforeAwait.mounted) {
                                          // Check mounted on stored context
                                          if (result.contains("successful")) {
                                            ScaffoldMessenger.of(
                                                    contextBeforeAwait)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text("Login successful!"),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            contextBeforeAwait
                                                .goNamed(RouteNames.HOME_SCREEN);
                                          } else {
                                            ScaffoldMessenger.of(
                                                    contextBeforeAwait)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Login failed, please try again"),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    },
                              child: authState is AsyncLoading
                                  ? CircularProgressIndicator(
                                      color: theme.colorScheme.primary,
                                    )
                                  : const Text("Login"),
                            ),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  context
                                      .goNamed(RouteNames.REGISTRATION_SCREEN);
                                },
                                child: Text(
                                  "Create an Account",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
