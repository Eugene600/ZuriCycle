import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showIntercourse = false;

  @override
  Widget build(BuildContext context) {
    // Hardcoded user details
    const String firstName = "Jane";
    const String lastName = "Doe";
    const String email = "janedoe@example.com";
    const String phoneNumber = "+1234567890";
    const String gender = "Female";
    const String birthDate = "1995-08-15";

    var theme = Theme.of(context);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   title: const Text('🪷 Profile'),
          //   pinned: true,
          //   floating: true,
          //   snap: true,
          //   centerTitle: true,
          //   // actions: [
          //   //   IconButton(
          //   //     onPressed: () {
          //   //       // Future edit functionality
          //   //     },
          //   //     icon: const Icon(Icons.mode_edit_outlined),
          //   //   ),
          //   // ],
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child:
                        const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "$firstName $lastName",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),
            
                  // User Information
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Icon(Icons.phone, color: theme.colorScheme.primary),
                          title: const Text("Phone Number",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(phoneNumber,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.male, color: theme.colorScheme.primary),
                          title: const Text("Gender",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle:
                              Text(gender, style: const TextStyle(fontSize: 16)),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.cake, color: theme.colorScheme.primary),
                          title: const Text("Birth Date",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(birthDate,
                              style: const TextStyle(fontSize: 16)),
                        ),
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
                          title: const Text("Show Intercourse on Calendar",
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                          leading:
                              const Icon(Icons.delete_forever, color: Colors.red),
                          title: const Text("Clear All Cycle Data",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            // _showConfirmationDialog(context, "Clear Cycle Data", "Are you sure you want to clear all your cycle data?");
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading:
                              const Icon(Icons.person_off, color: Colors.red),
                          title: const Text("Delete Account",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            // _showConfirmationDialog(context, "Delete Account", "This will permanently delete your account. Are you sure?");
                          },
                        ),
                      ],
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Text(
                  //     "Version \n v1.0.0",
                  //     style: theme.textTheme.bodyLarge
                  //         ?.copyWith(color: theme.colorScheme.primary),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
