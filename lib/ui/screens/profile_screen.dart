import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  ProfileScreen({
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.blue.shade500,
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text('Edit Profile'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.history, color: Colors.blue),
                title: Text('Order History'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.blue),
                title: Text('Wishlist'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.payment, color: Colors.blue),
                title: Text('Payment Methods'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text('Address Book'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
