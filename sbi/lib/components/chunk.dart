// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nike extends StatefulWidget {
  const Nike({super.key});

  @override
  State<Nike> createState() => _NikeState();
}

class _NikeState extends State<Nike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [],
            ),
          )
        ],
      )),
    );
  }
}
