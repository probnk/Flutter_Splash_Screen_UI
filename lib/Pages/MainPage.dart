import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice1/Pages/MyVault.dart';
import 'package:practice1/Pages/login.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapshot) {
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return MyVault();
              }else{
                return MyLogin();
              }
            }
            return Center(child: CircularProgressIndicator(),);
          }
      )
    );
  }
}
