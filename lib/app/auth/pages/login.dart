import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../display/display.dart';
import '../../../utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  // bool _loading = false;

  void _togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                          color: theme.colorScheme.primary),
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
                          OutlinedButton(
                              onPressed: () {}, child: const Text("Login")),
                          const SizedBox(height: Constants.SPACING),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Don't have an account,"),
                              TextButton(
                                  onPressed: () {
                                    context.goNamed(
                                        RouteNames.REGISTRATION_SCREEN);
                                  },
                                  child: const Text("Create an Account")),
                            ],
                          ),
                          // const SizedBox(height: Constants.SPACING),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     const Text("Can't remember your password,"),
                          //     TextButton(
                          //       onPressed: () {},
                          //       child: const Text("Forgot Password"),
                          //     ),
                          //   ],
                          // ),
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
