import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/views/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  
  @override
  Widget build(BuildContext context) {

  signOut() async
  {
    AuthService authService=AuthService();
    await authService.logout();
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder:(contex) =>const LoginScreen()));
  }
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(icon: const Icon(Icons.logout_rounded),
            tooltip: 'logout of App',
            onPressed: () {
              // handle the press
              signOut();
            },)
        ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          signOut();
        },
        child: Icon(Icons.logout_rounded),
        backgroundColor: Colors.green,
      ),
      body: const Center(child:Text('Home screen')),
      
    );
  }
}