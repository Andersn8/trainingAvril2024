// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:avril/RecipeListScreem.dart';
import 'package:flutter/material.dart';

class buton extends StatelessWidget {
  const buton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text de redirection"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(255, 3, 173, 8)),
                padding: MaterialStatePropertyAll(EdgeInsets.all(40))),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => RecipeListScreem()));
            },
            icon: Icon(
              Icons.change_history,
              size: 30,
            ),
            label: Text(
              "change Directorie",
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
