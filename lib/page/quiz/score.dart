import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  final int? score;
  const Score({this.score, Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Center(child: Text("okkk ${widget.score}")),
      )),
    );
  }
}
