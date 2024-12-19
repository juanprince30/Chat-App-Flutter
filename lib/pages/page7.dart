import 'dart:io';

import 'package:chat_app/tools/color.dart';
import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  final String tel;
  final String nom;
  final String prenom;
  final String? image;
  const Page7({required this.tel,required this.image,required this.prenom,required this.nom,super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    widget.image==null ?
    _image=null :
    _image=File(widget.image ?? "");
    return Scaffold(
      backgroundColor: mainColor, 
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text(
          'Reglages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: 
                CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: widget.image == null
                      ? const Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
                ),
                title: Text(
                  "${widget.nom} ${widget.prenom}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  widget.tel,
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
