import 'package:flutter/material.dart';
import 'package:monapp_odc/verify_screen.dart';
import 'phone_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: VerifyCodeScreen(),
    );
  }
}

/**
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedButtonIndex = 0;
  final List<String> messageList = [
    'Lieu A: 2 km',
    'Lieu B: 5 km',
    'Lieu C: 1 km',
    'Lieu D: 3 km',
  ];
  final List<String> buttonLabels = ['Tous', 'Resto', 'Parcs', 'Shop'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Center(
          child: Text(
            'MyFavPlaces',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.all(20),
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Search Bar
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue[200], // Fond bleu pour la SearchBar
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un lieu...',
                  hintStyle: TextStyle(color: Colors.black87),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(buttonLabels.length, (index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(50, 50),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    backgroundColor: selectedButtonIndex == index
                        ? Colors.blue
                        : Colors.white,
                    foregroundColor: selectedButtonIndex == index
                        ? Colors.white
                        : Colors.blue,
                    side: BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = index;
                    });
                    print('Bouton ${buttonLabels[index]} sélectionné');
                  },
                  child: Text(buttonLabels[index]),
                );
              }),
            ),

            // Container bleu avec la bulle de message et la liste
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bulle de message
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Liste des lieux proches :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Liste des messages
                        ...messageList.map((message) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              message,
                              style: TextStyle(color: Colors.blue),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
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
**/