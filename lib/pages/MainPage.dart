import 'package:chat_app/Pages/page5.dart';
import 'package:chat_app/Pages/page6.dart';
import 'package:chat_app/Pages/page7.dart';
import 'package:chat_app/Pages/page8.dart';
import 'package:chat_app/tools/color.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  final String tel;
  final String nom;
  final String prenom;
  final String? image;
  const Mainpage({required this.tel,required this.image,required this.prenom,required this.nom,super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int pageIndex = 0;

  final PageController _pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void onBottomNavTapped(int index) {
    setState(() {
      pageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children:  [
          const Page5(),
          const Page6(),
          Page7(tel: widget.tel,image: widget.image, prenom: widget.prenom, nom: widget.nom)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        color: mainColor,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  onBottomNavTapped(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndex == 0 ? 
                    const Column(
                      children: [
                        Text(
                          'Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Icon(Icons.circle,size: 10, color: Colors.white,),
                      ],
                    )
                    :
                    const Icon(
                      Icons.people_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  onBottomNavTapped(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndex == 1 ? 
                    const Column(
                      children: [
                        Text(
                          'Chats',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Icon(Icons.circle,size: 10, color: Colors.white,),
                      ],
                    )
                    :
                    const Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 30,
                onPressed: () {
                  onBottomNavTapped(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndex == 2 ? 
                    const Column(
                      children: [
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Icon(Icons.circle,size: 10, color: Colors.white,),
                      ],
                    )
                    :
                    const Icon(
                      Icons.more_horiz,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}