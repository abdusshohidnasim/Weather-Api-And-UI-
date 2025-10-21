import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row TopBar(VoidCallback ontab,VoidCallback onatab2){
  return Row(
    children: [
      const Icon(Icons.gamepad),
      const Spacer(),
      IconButton(
        icon: const Icon(Icons.light_mode),
        onPressed: ontab,
      ),
      const SizedBox(width: 10),
      IconButton(
        icon: const Icon(Icons.dark_mode),
        onPressed: onatab2,
      ),
    ],
  );
}