import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo or Icon
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
            SizedBox(height: 20),
            // App Name and Version
            Center(
              child: Column(
                children: [
                  Text(
                    'Health Care X',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Version 1.0',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // About Description
            Text(
              'About Health Care X',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Health Care X is a comprehensive hospital management system designed to streamline operations and improve patient care. Our goal is to provide a seamless experience for doctors, nurses, and administrators while ensuring top-notch care for patients.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            // Features or Key Points
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '• Patient Management\n'
              '• Appointment Scheduling\n'
              '• Medical Records\n'
              '• Billing & Invoicing\n'
              '• Reporting & Analytics',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            // Footer or Contact Info
            Center(
              child: Text(
                '© 2024 Health Care X. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
