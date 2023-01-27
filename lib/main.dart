// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Similar image'),
          backgroundColor: Colors.deepPurple,
        ),
        body: similarImage(),
      ),
    ),
  );
}

class similarImage extends StatefulWidget {
  const similarImage({super.key});

  @override
  State<similarImage> createState() => _similarImageState();
}

class _similarImageState extends State<similarImage> {
  int LiftImageNumber = 1, RightImageNumber = 2;
  void ChangeImages() {
    LiftImageNumber = Random().nextInt(8) + 1;
    RightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LiftImageNumber == RightImageNumber ? 'you are win.' : 'Try again',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeImages();
                      });
                    },
                    child: Image.asset('images/image-$LiftImageNumber.png')),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ChangeImages();
                    });
                  },
                  child: Image(
                    image: AssetImage('images/image-$RightImageNumber.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
