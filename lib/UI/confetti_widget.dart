import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiAnimation extends StatefulWidget {
  const ConfettiAnimation({super.key});

  @override
  ConfettiAnimationState createState() => ConfettiAnimationState();
}

class ConfettiAnimationState extends State<ConfettiAnimation>
    with TickerProviderStateMixin {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _controller.play(); // Play the animation on initState()
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConfettiWidget(
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: const [
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.yellow,
          ],
        ),
      ],
    );
  }
}
