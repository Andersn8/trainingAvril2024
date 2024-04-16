// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_field, unused_import

import 'package:avril/RecipeListScreem.dart';
import 'package:avril/formulaire.dart';
import 'package:avril/recipeScreem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentindex = 0;

  CurrentStateIndex(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: [
              Text("Home page "),
              Text(" Users List "),
              Text("Formulaire ")
            ][_currentindex],
            centerTitle: true,
          ),
          body: [
            recipeScreem(),
            RecipeListScreem(),
            Formulaire()
          ][_currentindex],
          bottomNavigationBar: BottomNavigationBar(
              iconSize: 20,
              onTap: (index) => CurrentStateIndex(index),
              selectedItemColor: Colors.orangeAccent,
              unselectedItemColor: const Color.fromARGB(255, 34, 38, 46),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
              ]),
        ));
  }
}
