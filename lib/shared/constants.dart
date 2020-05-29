import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  //hintText: 'Email',
  fillColor: Colors.amber,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.amber,width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink,width: 2.0)
  ),
);