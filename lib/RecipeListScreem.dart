// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, avoid_function_literals_in_foreach_calls, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, unused_element, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'package:avril/modele/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecipeListScreem extends StatefulWidget {
  const RecipeListScreem({super.key});

  @override
  State<RecipeListScreem> createState() => _RecipeListScreemState();
}

class _RecipeListScreemState extends State<RecipeListScreem> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(Users userData) async {
      final image;
      if (userData.sexe == "feminin") {
        image = "assets/images/Femme.png";
      } else {
        image = "assets/images/Homme.png";
      }
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '${userData.nom} ${userData.prenom}',
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image.asset(
                    "${image}",
                    width: 100,
                    height: 100,
                    // fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${userData.description}'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  label: Text("Inviter")),
              SizedBox(
                width: 50,
              ),
              TextButton(
                child: const Text('Fermer'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Center(child: Text("aucun utilisateurs"));
          }
          List<Users> users = [];
          snapshot.data!.docs.forEach((data) {
            users.add(Users.formData(data));
          });
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final sexe = user.sexe;
                final description = user.description;
                Timestamp tmsp = user.date;
                String date = DateFormat.yMd().add_jm().format(tmsp.toDate());
                final img;
                if (sexe == "feminin") {
                  img = "assets/images/Femme.png";
                } else {
                  img = "assets/images/Homme.png";
                }
                final nom = user.nom;
                final prenom = user.prenom;
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Image.asset(
                      "$img",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "$nom              ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 0, 88)),
                    ),
                    subtitle: Text(
                      "$prenom         $date",
                      style: TextStyle(
                          fontSize: 10, color: Color.fromARGB(255, 24, 24, 24)),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () => _showMyDialog(user),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
