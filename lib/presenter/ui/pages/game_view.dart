import 'package:flutter/material.dart';
import 'package:jokenpo/presenter/ui/components/app_bar.dart';
import 'package:jokenpo/presenter/ui/components/body_buttons.dart';
import 'package:jokenpo/presenter/ui/components/body_options.dart';
import 'package:jokenpo/presenter/ui/components/body_result.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BodyOptions(),
              const BodyResult(),
              const BodyButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
