import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded user details
    const String firstName = "Jane";
    const String lastName = "Doe";
    const String email = "janedoe@example.com";
    const String phoneNumber = "+1234567890";
    const String gender = "Female";
    const String birthDate = "1995-08-15";

    return Scaffold(
      appBar: AppBar(
          title: const Text('👤 Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Future edit functionality
            },
            icon: const Icon(Icons.mode_edit_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              "$firstName $lastName",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // User Information
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Column(
                children: [
                  _buildProfileItem(Icons.phone, "Phone Number", phoneNumber),
                  _buildProfileItem(Icons.male, "Gender", gender),
                  _buildProfileItem(Icons.cake, "Birth Date", birthDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for ListTile items
  Widget _buildProfileItem(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.pink),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}
