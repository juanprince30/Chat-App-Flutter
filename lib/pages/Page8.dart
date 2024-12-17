import 'dart:io';
import 'package:chat_app/tools/color.dart';
import 'package:chat_app/Models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page8 extends StatefulWidget {
  String name;
  Page8({required this.name,super.key});

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  final messageKey= GlobalKey<FormState>();
  TextEditingController messageController=TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool showCamra=false;
  final ImagePicker picker = ImagePicker();
  String imagePath = "";
  XFile? image;

  List<Message> messages = [
    Message(image:null,body: "hi prince", sender: "me", read: true, date: "05/12/2024", heure: "19.00"),
    Message(image:null,body: "yo man", sender: "h5s", read: true, date: "05/12/2024", heure: "19.04"),
    Message(image:null,body: "what's up. I want to talk about last night... with hannah", sender: "me", read: true, date: "05/12/2024", heure: "19.07"),
    Message(image:null,body: "answer me bro I'm very sorry about it", sender: "me", read: true, date: "05/12/2024", heure: "19.50"),
    Message(image:null,body: "no don't worry It's nothing", sender: "his", read: true, date: "05/12/2024", heure: "19.56"),
    Message(image:null,body: "forget that shit bro", sender: "his", read: true, date: "05/12/2024", heure: "19.59"),
    Message(image:null,body: "hi prince", sender: "me", read: true, date: "05/12/2024", heure: "20.00"),
    Message(image:null,body: "hi prince", sender: "me", read: true, date: "05/12/2024", heure: "21.00"),
    Message(image:null,body: "hi prince", sender: "me", read: true, date: "05/12/2024", heure: "22.00"),
    Message(image:null,body: "hi prince", sender: "me", read: true, date: "05/12/2024", heure: "23.00"),
    Message(image:null,body: "Stop texting me nigga... I will kill you son of bitch. Don't disturb me again... Fuck off dick head", sender: "his", read: true, date: "06/12/2024", heure: "04.00"),
    Message(image:null,
      body: "Hey man, I’ve been meaning to talk to you about something that’s been on my mind for quite a while now. I know it might seem odd to bring it up like this, but I feel like it’s better to clear the air rather than let things linger between us. Remember last week when we had that heated argument? I know I might have said things that I didn’t really mean, and I just wanted to take a moment to apologize for anything I might have done or said to hurt you. You’re one of my closest friends, and the last thing I want is to jeopardize that over some misunderstanding or momentary lapse in judgment. I’ve been replaying our conversation in my head, and honestly, I regret not handling things more calmly. I hope we can move past it and continue to support each other like we always have. Let me know when you have some time to chat about this properly. Take care, and thanks for understanding.",
      sender: "me",
      read: false,
      date: "06/12/2024",
      heure: "08.44",
    ),

  ];

  void addMessage(String body) {
    DateTime now = DateTime.now();
    String currentDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
    String currentTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    setState(() {
      messages.add(
        Message(
          image:null,
          body: body,
          sender: "me",
          read: false,
          date: currentDate,
          heure: currentTime,
        ),
      );
      _scrollToBottom();
    });
  }

  void addImage(String body, String image) {
    DateTime now = DateTime.now();
    String currentDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
    String currentTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    setState(() {
      messages.add(
        Message(
          image:image,
          body: body,
          sender: "me",
          read: false,
          date: currentDate,
          heure: currentTime,
        ),
      );
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollToBottom();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: mainColor,
        leading:  IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
        ),
        title:  Text(widget.name,style: const TextStyle(color: Colors.white),),
        actions: const [
          Icon(Icons.search, color: Colors.white,),
          SizedBox(width: 8,),
          Icon(Icons.menu, color: Colors.white,),
          SizedBox(width: 8,),
        ],
      ),
      backgroundColor: secondColor,
      body: Container(
          height: MediaQuery.of(context).size.height-80-MediaQuery.of(context).viewInsets.bottom+(messages.length*50),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Expanded(
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  scrollDirection: Axis.vertical,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    // Vérifie si la date est différente de la précédente
                    bool showDate = (index == 0) || (messages[index].date != messages[index - 1].date);
                    String temp =messages[index].image ?? "";
                    
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (showDate)
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 2,
                                  color: Colors.white,
                                ),
                                Text(
                                  messages[index].date,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 2,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        // Affichage du message
                        messages[index].sender == "me"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width*2) / 3,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: blueOurColor,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        messages[index].image != null && temp != "" 
                                          ? Image.file(File(temp)) 
                                          : Container(),
                                        Text(messages[index].body, style: const TextStyle(color: Colors.white)),
                                        Text(
                                          "${messages[index].heure} - ${messages[index].read ? 'lu' : 'Non lu'}",
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width*2) / 3,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        messages[index].image != null && temp != "" 
                                          ? Image.file(File(temp)) 
                                          : Container(),
                                        Text(messages[index].body, style: const TextStyle(color: Colors.white)),
                                        Text(messages[index].heure, style: const TextStyle(color: Colors.white, fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 80+MediaQuery.of(context).viewInsets.bottom,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        color: mainColor,
        child: SizedBox(
            height: 60, 
            child: Form(
              key: messageKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                        onTap: () {
                          print('Bouton cliqué');
                          setState(() {
                            showCamra= !showCamra;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 15, right: 5.0),
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width-100,
                    child: TextFormField(
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      style:  const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: secondColor,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                    ),
                  ),
          
                  GestureDetector(
                    onTap: () {
                      if (messageController.text.trim().isNotEmpty) {
                        addMessage(messageController.text.trim());
                        messageController.clear();
                      }

                    },
                    child: Padding(
                      padding:  const EdgeInsets.only(top: 15,left: 5.0),
                      child:  Icon(
                              Icons.send,
                              size: 24,
                              color: blueOurColor,
                            ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: showCamra ? 1.0 : 0.0, // L'opacité varie selon la valeur de showCamra
        duration: const Duration(milliseconds: 300), // Durée de l'animation
        child: showCamra
            ? Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: () async {
                          final image_ = await picker.pickImage
                                (source: ImageSource.camera);
                      
                               setState(() {
                                 if(image_ != null){
                                   image = image_;
                                   imagePath = image!.path;
                                   addImage("", imagePath);
                                   imagePath="";
                                   image=null;
                                 }
                                 _scrollToBottom();
                               });
                        },
                        child: Icon(Icons.photo_camera, color: blueOurColor),
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () async {
                          final image_ = await picker.pickImage
                                (source: ImageSource.gallery);
                      
                               setState(() {
                                 if(image_ != null){
                                   image = image_;
                                   imagePath = image!.path;
                                   addImage("", imagePath);
                                   imagePath="";
                                   image=null;
                                   _scrollToBottom();
                                 }
                               });
                        },
                        child: Icon(Icons.image, color: blueOurColor),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(), // Retirer le bouton quand showCamra est faux
      ),

    );
  }
}