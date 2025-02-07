import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../display/display.dart';
import '../../../utils/utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;

  void _togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight: 100.0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          SliverToBoxAdapter(
            child: ResponsiveWidgetFormLayout(
              buildPageContent: (BuildContext context, Color? color) => SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(Constants.SPACING * 2),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FormBuilder(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            Center(
                              child: Text(
                                "ZuriCycle".toUpperCase(),
                                style: TextStyle(
                                    fontSize: theme.textTheme.displayLarge?.fontSize,
                                    color: theme.colorScheme.primary),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              "Create Account 👋",
                              style: TextStyle(fontSize: 40),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text("First Name"),
                            FormBuilderTextField(
                              name: 'first_name',
                              decoration: const InputDecoration(
                                  hintText: "John",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(2),
                              ]),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text("Last Name"),
                            FormBuilderTextField(
                              name: 'last_name',
                              decoration: const InputDecoration(
                                hintText: "Doe",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(2),
                              ]),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text("Gender"),
                            FormBuilderDropdown(
                              name: 'gender',
                              decoration: const InputDecoration(
                                hintText: "Select your gender",
                                prefixIcon: Icon(Icons.wc),
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 'Male', child: Text('Male')),
                                DropdownMenuItem(
                                    value: 'Female', child: Text('Female')),
                                // DropdownMenuItem(
                                //     value: 'Other', child: Text('Other')),
                              ],
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text("Email"),
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
                            const Text("Date of Birth"),
                            FormBuilderDateTimePicker(
                              name: 'dob',
                              firstDate: DateTime(1920),
                              lastDate: DateTime.now(),
                              decoration: const InputDecoration(
                                hintText: "Enter your date of birth",
                                prefixIcon: Icon(Icons.calendar_month_rounded),
                                border: OutlineInputBorder(),
                              ),
                              inputType: InputType.date,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              // onChanged: (date) {
                              //   if (date != null) {
                              //     String formattedDob =
                              //         DateFormat('yyyy-MM-dd').format(date);
                              //     debugPrint(
                              //         "Formatted Date of Birth: $formattedDob");
                              //   }
                              // },
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text("Phone Number"),
                            FormBuilderTextField(
                              name: 'phone_number',
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: "e.g. 0712345678",
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(10),
                                FormBuilderValidators.minLength(10)
                              ]),
                              maxLength: 10,
                            ),
                            const SizedBox(height: Constants.SPACING),
                            const Text("Password"),
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
                            const SizedBox(height: Constants.SPACING),
                            const Text("Confirm Password"),
                            FormBuilderTextField(
                              name: 'confirm_password',
                              obscureText: _hidePassword,
                              decoration: InputDecoration(
                                hintText: "Confirm your password",
                                prefixIcon: const Icon(Icons.password),
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
                                (value) => _formKey
                                            .currentState!.value['password'] !=
                                        value
                                    ? "Confirm password must match with password"
                                    : null
                              ]),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () {
                                //Will add later more logic
                              }, 
                              child: const Text("Register"),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Already have an account,"),
                                TextButton(
                                  onPressed: () {
                                    context.goNamed(RouteNames.LOGIN_SCREEN);
                                  },
                                  child: const Text("Login"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
