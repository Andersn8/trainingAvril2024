// ignore_for_file: unused_field, prefer_final_fields, unused_local_variable, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _marge = 20.0;
  String selectedelement = "masculin";
  final _formkey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _descController = TextEditingController();

  DateTime _yourDate = DateTime.now();
  @override
  void dispose() {
    super.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(_marge),
      child: Form(
        key: _formkey,
        child: ListView(
          children: [
            Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nom ",
                  hintText: "entrer le nom ",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "entrer le nom";
                  } else {
                    return null;
                  }
                },
                controller: _nomController,
              ),
              SizedBox(
                height: _marge,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Prenom ",
                  hintText: "entrer le prenom",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "entrer un prenom";
                  } else {
                    return null;
                  }
                },
                controller: _prenomController,
              ),
              SizedBox(
                height: _marge,
              ),
              /* DateTimeFormField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'choose the date ',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onChanged: (DateTime? value) {
                  _yourDate = value!;
                },
              ),
              SizedBox(
                height: _marge,
              ),*/
              DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: [
                  DropdownMenuItem(value: "masculin", child: Text("masculin")),
                  DropdownMenuItem(value: "feminin", child: Text("feminin")),
                ],
                value: selectedelement,
                onChanged: (value) {
                  selectedelement = value!;
                },
              ),
              SizedBox(
                height: _marge,
              ),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Description ",
                  hintText: "entrer une description",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "entrer une description";
                  } else {
                    return null;
                  }
                },
                controller: _descController,
              ),
              SizedBox(
                height: _marge,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        final nom = _nomController.text;
                        final prenom = _prenomController.text;
                        final description = _prenomController.text;
                        DateTime dateinscrt = DateTime.now();

                        CollectionReference colref =
                            FirebaseFirestore.instance.collection("users");
                        colref.add({
                          "Nom": nom,
                          "prenom": prenom,
                          "sexe": selectedelement,
                          "date": dateinscrt,
                          "description": description
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("veiller tout remplir")));
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    icon: const Icon(
                      Icons.save,
                      size: 20,
                      color: Colors.white,
                    ),
                    label: const Text("Enregister")),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
