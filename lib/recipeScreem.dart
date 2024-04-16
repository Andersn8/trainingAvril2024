// ignore_for_file: use_key_in_widget_constructors, camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors

import 'package:avril/favoriteButton.dart';
import 'package:flutter/material.dart';

class recipeScreem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget stack = Stack(
      children: [
        Container(
          width: 600,
          height: 300,
          child: const Center(child: CircularProgressIndicator()),
        ),
        Image.asset(
          "assets/images/14531.jpg",
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
      ],
    );
    Widget first =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Par nono anderson",
                style: TextStyle(fontSize: 15, fontFamily: "bungee"),
              ),
            ),
            const Text(
              "laissons parler notre créativité",
              style: TextStyle(fontSize: 10, color: Colors.black45),
            )
          ],
        ),
      ),
      favoriteButton(
        isfarite: false,
        favoriteCount: 20,
      ),
    ]);
    Widget describe = const Column(
      children: [
        Text(
            "Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)")
      ],
    );
    return ListView(
      children: [
        stack,
        Padding(padding: const EdgeInsets.all(10), child: first),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _generateColumn(
                Colors.orangeAccent, Icons.message_outlined, "Message"),
            _generateColumn(Colors.orangeAccent, Icons.share, "share"),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: describe)
      ],
    );
  }
}

Column _generateColumn(Color color, IconData icon, String label) {
  return Column(
    children: [
      Icon(
        icon,
        size: 30,
        color: color,
      ),
      Text(
        label,
        style: TextStyle(fontSize: 10, color: color),
      )
    ],
  );
}
