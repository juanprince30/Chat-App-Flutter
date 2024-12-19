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
  List<Map<String, dynamic>> contacts = []; // Liste de contacts
  List<Map<String, dynamic>> filteredContacts = [];
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _searchController =
  
  TextEditingController(); // Contrôleur pour la recherche
  String _statut = 'En ligne';
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Fonction pour filtrer les contacts en fonction du texte de recherche
  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact['nom'].toLowerCase().contains(query.toLowerCase()) ||
              contact['prenom'].toLowerCase().contains(query.toLowerCase()) ||
              contact['numero'].contains(query))
          .toList();
    });
  }

  Future<void> _selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Ajouter un contact
  void addContact() {
    String numero = _numController.text;
    if (_nomController.text.isEmpty ||
        _prenomController.text.isEmpty ||
        numero.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Veuillez remplir tous les champs et ajouter une image.')));
    } else if (contacts.any((contact) => contact['numero'] == numero)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Le contact avec ce numéro existe déjà.')));
    } else {
      Map<String, dynamic> newContact = {
        'nom': _nomController.text,
        'prenom': _prenomController.text,
        'numero': numero,
        'statut': _statut,
        'image': _image,
      };
      setState(() {
        contacts.add(newContact); // Ajouter le contact à la liste
        filteredContacts =
            List.from(contacts); // Réinitialiser la liste filtrée
      });

      // Réinitialiser les champs après ajout
      _nomController.clear();
      _prenomController.clear();
      _numController.clear();
      setState(() {
        _image = null;
      });
    }
  }

  // Afficher le bottom sheet pour ajouter un contact
  void showBottomSheetContent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Ajout de contact',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _numController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Numéro de téléphone'),
              ),
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              TextField(
                controller: _prenomController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                ),
              ),
              DropdownButton<String>(
                value: _statut,
                onChanged: (String? newValue) {
                  setState(() {
                    _statut = newValue!;
                  });
                },
                items: ['En ligne', 'Hors ligne']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              _image == null
                  ? Text('Aucune image sélectionnée')
                  : Image.file(_image!, height: 30, width: 400),
              ElevatedButton(
                onPressed: _selectImage,
                child: Text('Sélectionner une image'),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: addContact,
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Pour que le Row prenne la taille du contenu
                  children: [
                    Icon(Icons.save, size: 24), // Icône de sauvegarde
                    SizedBox(width: 8), // Espacement entre l'icône et le texte
                    Text(
                      'Enregistrer',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(contacts); // Initialiser filteredContacts
    _searchController.addListener(() {
      _filterContacts(_searchController
          .text); // Appeler la fonction de filtrage à chaque modification du texte de recherche
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        title: const Text('Contacts', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              showBottomSheetContent(context); // Appel de la méthode
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Rechercher',
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
            Expanded(
              child: ListView.builder(
                itemCount: filteredContacts.length,
                itemBuilder: (context, index) {
                  final contact = filteredContacts[index];
                  return ListTile(
                    leading: contact['image'] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                                30), // Pour arrondir l'image
                            child: Image.file(contact['image'],
                                width: 50, height: 50, fit: BoxFit.cover),
                          )
                        : CircleAvatar(
                            radius:
                                25, // Pour garder la rondeur en cas d'absence d'image
                            child: Icon(Icons.person),
                          ),
                    title: Row(
                      children: [
                        Text(
                          '${contact['prenom']} ${contact['nom']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: ' Almayra Zamzamy'),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      contact['statut'],
                      style: TextStyle(color: Colors.white70),
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
