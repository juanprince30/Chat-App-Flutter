import 'package:chat_app/Pages/page8.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/tools/color.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key});


  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  final List<Map<String, dynamic>> chatData = [
    {
      'name': 'Athalia Putri',
      'message': 'Good morning, did you sleep well?',
      'time': 'Today',
      'profilePic': 'https://via.placeholder.com/150',
      'unreadCount': 1,
    },
    {
      'name': 'Raki Devon',
      'message': 'How is it going?',
      'time': '17/6',
      'profilePic': null,
      'unreadCount': 0,
    },
    {
      'name': 'Erlan Sadewa',
      'message': 'Aight, noted',
      'time': '17/6',
      'profilePic': 'https://via.placeholder.com/150',
      'unreadCount': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        title: const Text('Chats', style: TextStyle(fontSize: 20)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.playlist_add_check,
              size: 40,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          // Section au-dessus de la barre de recherche
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var chat in chatData)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: chat['profilePic'] != null
                              ? NetworkImage(chat['profilePic'])
                              : null,
                          backgroundColor: chat['profilePic'] == null
                              ? blueOurColor
                              : Colors.transparent,
                          child: chat['profilePic'] == null
                              ? Text(
                                  chat['name'][0],
                                  style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                                )
                              : null,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          chat['name'].split(' ')[0],
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: const Icon(Icons.search, color: Colors.white60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Chat list
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return ListTile(
                  onTap:() {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> Page8(name: chat['name'],)),
                  );
                  },
                  leading: chat['profilePic'] != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(chat['profilePic']),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            chat['name'][0],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                  title: Text(
                    chat['name'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat['message'],
                    style: TextStyle(color: Colors.white70),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat['time'],
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                      if (chat['unreadCount'] > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat['unreadCount'].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}