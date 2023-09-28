import 'package:flutter/material.dart';

class Player {
  static Text playerX() => Text(
        'X',
        style: TextStyle(color: Colors.cyan.shade900, fontSize: 30),
      );

  static Text playerO() => Text(
        'O',
        style: TextStyle(color: Colors.cyan.shade400, fontSize: 30),
      );

  static Text empty() => const Text(
        '',
      );
}
