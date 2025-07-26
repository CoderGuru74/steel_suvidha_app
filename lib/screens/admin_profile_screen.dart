import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// Dummy User Data for the profile
class CurrentAdminUser {
  final String id;
  final String name;
  final String email;
  final String role;
  final String lastLogin;
  final String department;
  final String contactNumber;
  final String address;

  CurrentAdminUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.lastLogin,
    this.department = 'IT & Administration',
    this.contactNumber = '+91 98765 43210',
    this.address = '123 Admin Lane, Admin City, AB 12345',
  });
}

final CurrentAdminUser dummyAdminUser = CurrentAdminUser(
  id: 'ADM001',
  name: 'Admin User',
  email: 'admin.user@figmaapp.com',
  role: 'Super Admin',
  lastLogin: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now().subtract(const Duration(minutes: 10))),
  department: 'System Administration',
  contactNumber: '+91 99887 76655',
  address: '456 Tech Park, Digital Street, New Delhi, 110001',
);


class AdminProfileScreen extends StatelessWidget {
  final CurrentAdminUser user;

  const AdminProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Profile'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Text(
                user.name[0],
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              user.role,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            _buildInfoCard(
              context,
              icon: Icons.email,
              title: 'Email',
              value: user.email,
            ),
            _buildInfoCard(
              context,
              icon: Icons.phone,
              title: 'Contact Number',
              value: user.contactNumber,
            ),
            _buildInfoCard(
              context,
              icon: Icons.business,
              title: 'Department',
              value: user.department,
            ),
            _buildInfoCard(
              context,
              icon: Icons.location_on,
              title: 'Address',
              value: user.address,
            ),
            _buildInfoCard(
              context,
              icon: Icons.login,
              title: 'Last Login',
              value: user.lastLogin,
            ),
            _buildInfoCard(
              context,
              icon: Icons.perm_identity,
              title: 'Admin ID',
              value: user.id,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement Edit Profile functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Profile Pressed')),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                // TODO: Implement Change Password functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Change Password Pressed')),
                );
              },
              icon: const Icon(Icons.lock),
              label: const Text('Change Password'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, {required IconData icon, required String title, required String value}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 28),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}