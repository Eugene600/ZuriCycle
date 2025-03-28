import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zuricycle/app/auth/auth.dart';

import '../../../utils/utils.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool showIntercourse = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userNotifierProvider.notifier).getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    var theme = Theme.of(context);

    return userState.when(
      data: (user) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // Fixed header section (non-scrollable)
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person,
                            size: 50, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      user != null
                          ? Text(
                              "${user.first_name} ${user.last_name}",
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          : const Text("No user found"),
                      const SizedBox(height: 8),
                      user != null
                          ? Text(
                              user.email,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            )
                          : const Text("No email found"),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // Scrollable content section
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 2,
                              child: Column(
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.phone,
                                          color: theme.colorScheme.primary),
                                      title: const Text("Phone Number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      subtitle: user != null
                                          ? Text(user.phone_number,
                                              style:
                                                  const TextStyle(fontSize: 16))
                                          : Text("No Phone Number found")),
                                  ListTile(
                                      leading: Icon(Icons.male,
                                          color: theme.colorScheme.primary),
                                      title: const Text("Gender",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      subtitle: user != null
                                          ? Text(user.gender,
                                              style:
                                                  const TextStyle(fontSize: 16))
                                          : Text("No gender found")),
                                  ListTile(
                                      leading: Icon(Icons.cake,
                                          color: theme.colorScheme.primary),
                                      title: const Text("Birth Date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      subtitle: user != null
                                          ? Text(
                                              user.birth_date ??
                                                  "No birth date found",
                                              style:
                                                  const TextStyle(fontSize: 16))
                                          : Text("No birth date found")),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary),
                            ),
                            const SizedBox(height: 10),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 2,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.visibility,
                                        color: theme.colorScheme.primary),
                                    title: const Text(
                                        "Show Intercourse on Calendar",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    trailing: Switch(
                                      value: showIntercourse,
                                      onChanged: (bool value) {
                                        setState(() {
                                          showIntercourse = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Critical Actions Section
                            const Text(
                              "Critical Actions",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                            const SizedBox(height: 10),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 2,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.delete_forever,
                                        color: Colors.red),
                                    title: const Text("Clear All Cycle Data",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    onTap: () {
                                      // _showConfirmationDialog(context, "Clear Cycle Data", "Are you sure you want to clear all your cycle data?");
                                    },
                                  ),
                                  const Divider(),
                                  ListTile(
                                    leading: const Icon(Icons.person_off,
                                        color: Colors.red),
                                    title: const Text("Delete Account",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Delete Account"),
                                            content: const Text(
                                                "Are you sure you want to delete your account? This will permanenty delete your account."),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  context.pop();
                                                },
                                                child: const Text("Cancel"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  ref
                                                      .read(userNotifierProvider
                                                          .notifier)
                                                      .deleteUser();

                                                  context.goNamed(
                                                      RouteNames.LOGIN_SCREEN);
                                                },
                                                child: const Text("Delete"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(
          'Failed to load page: Please try again',
          style: const TextStyle(color: Colors.red),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
