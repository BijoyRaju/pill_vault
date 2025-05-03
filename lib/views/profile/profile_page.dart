import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2), // Background color for entire screen
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('asset/image/Bg image (1).png'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Susan Roy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "susanroy2002@email.com",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
