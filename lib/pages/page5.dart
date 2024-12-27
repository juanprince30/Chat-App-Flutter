import 'dart:io';

import 'package:chat_app/tools/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  List<Map<String, dynamic>> messages = []; // Liste des messages
  final TextEditingController _messageController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Ajouter un message
  void sendMessage() {
    if (_messageController.text.isEmpty && _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Veuillez écrire un message ou ajouter une image.'),
      ));
      return;
    }

    Map<String, dynamic> newMessage = {
      'message': _messageController.text,
      'image': _image,
      'date': DateTime.now().toString(),
    };

    setState(() {
      messages.add(newMessage); // Ajouter le message à la liste
    });

    // Réinitialiser les champs après envoi
    _messageController.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        title: const Text(
          'Communauté ODC',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _messageController,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Rédiger un message...',
                      hintStyle: const TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _selectImage,
                        child: Row(
                          children: const [
                            Icon(Icons.image),
                            SizedBox(width: 8),
                            Text('Ajouter une image'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: sendMessage,
                        child: Row(
                          children: const [
                            Icon(Icons.send),
                            SizedBox(width: 8),
                            Text('Envoyer'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (_image != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.file(
                        _image!,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
            const Divider(color: Colors.white60),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Card(
                    color: Colors.white10,
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message['image'] != null)
                            Image.file(
                              message['image'],
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          if (message['message'].isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                message['message'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              message['date'],
                              style: const TextStyle(
                                  color: Colors.white60, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
