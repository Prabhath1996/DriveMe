import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(78, 228, 178, 1),
      body: SafeArea(
        
              child: Container(
                
                
          height: double.infinity,
          decoration: BoxDecoration(
            
            image: DecorationImage(
              fit: BoxFit.cover,
              image: 
            AssetImage('asset/img/logo.png'))
          ),
        ),
      ),
      
    );
  }
}