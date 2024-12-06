import 'package:flutter/material.dart';

class Identity extends StatefulWidget {
  @override
  _IdentityState createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget Example"),
      ),
      body: Center(
        child: Text("This is a StatefulWidget page."),
      ),
    );
  }
}
