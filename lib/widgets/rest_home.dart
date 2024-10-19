
//qa_home danh cho QA officer home
//rest_home danh cho Rest Home
import 'package:flutter/material.dart';


import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/views/login_screen.dart';

class RestaurantHome extends StatelessWidget {
  const RestaurantHome({super.key});

  signOut(BuildContext context) async
    {
      AuthService authService=AuthService();
      await authService.logout();
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder:(contex) =>const LoginScreen()));
    }
  @override
  Widget build(BuildContext context) {

    
    return  Scaffold(
      appBar: AppBar(
        title: const Text('QA Officer Home Screen'),
        actions: [
          IconButton(icon: const Icon(Icons.logout_rounded),
            tooltip: 'logout of App',
            onPressed: () {
              // handle the press
              signOut(context);
            },)
        ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          signOut(context);
        },
        child: Icon(Icons.logout_rounded),
        backgroundColor: Colors.green,
      ),
      body: const Center(child:Text('Home screen')),
      
    );
  }
}