import 'package:chat_app/tools/color.dart';
import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor, 
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text(
          'More',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                'Almayra Zamzamy',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                '+62 1309 - 1710 - 1920',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const Divider(color: Colors.white54),
            _buildMenuItem(Icons.account_circle, 'Account'),
            _buildMenuItem(Icons.chat, 'Chats'),
            _buildMenuItem(Icons.brightness_6, 'Appearance'),
            _buildMenuItem(Icons.notifications, 'Notification'),
            _buildMenuItem(Icons.lock, 'Privacy'),
            _buildMenuItem(Icons.data_usage, 'Data Usage'),
            _buildMenuItem(Icons.help, 'Help'),
            _buildMenuItem(Icons.mail, 'Invite Your Friends'),
          ],
        ),
      )
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
