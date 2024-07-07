import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF66B2B2),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.lock, color: Colors.red),
            title: Text('Privacy Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Handle privacy settings tap
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.bell, color: Colors.red),
            title: Text('Notification Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Handle notification settings tap
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.globe, color: Colors.red),
            title: Text('Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Handle language settings tap
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.question_circle, color: Colors.red),
            title: Text('Help & Support', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Handle help & support tap
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.info_circle, color: Colors.red),
            title: Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Handle about tap
            },
          ),
        ],
      ),
    );
  }
}
