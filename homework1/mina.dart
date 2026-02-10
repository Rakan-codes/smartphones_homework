import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); 


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(), 
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Name: Rakan Al-sahli'),
            Text('id: 445159209'),
          ],
        ),
      ),
    );
  }
}
