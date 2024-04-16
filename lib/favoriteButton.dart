// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';

class favoriteButton extends StatefulWidget {
  final bool isfarite;
  final int favoriteCount;
  const favoriteButton(
      {Key, key, required this.isfarite, required this.favoriteCount})
      : super(key: key);

  @override
  State<favoriteButton> createState() =>
      _favoriteButtonState(this.isfarite, this.favoriteCount);
}

class _favoriteButtonState extends State<favoriteButton> {
  bool _isfarite;
  int _favoriteCount;
  _favoriteButtonState(this._isfarite, this._favoriteCount);

  void isfavoritechecke() {
    setState(() {
      if (_isfarite) {
        _isfarite = false;
        _favoriteCount -= 1;
      } else {
        _isfarite = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: isfavoritechecke,
          icon: _isfarite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.orangeAccent,
        ),
        Text(
          "$_favoriteCount",
          style: TextStyle(color: Colors.deepOrange, fontSize: 12),
        )
      ],
    );
  }
}
