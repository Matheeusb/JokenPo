import 'package:jokenpo/presenter/enums/choices.dart';
import 'package:jokenpo/presenter/enums/results.dart';

abstract class GameState {
  final String imagePath;
  final Choices? choice;
  final Results? result;

  GameState({
    required this.imagePath,
    this.choice,
    this.result,
  });
}

class GameInit extends GameState {
  GameInit() : super(imagePath: 'assets/images/default.png');
}

class GameInProgress extends GameState {
  GameInProgress({required Choices choice})
      : super(
          imagePath: 'assets/images/default.png',
          choice: choice,
        );
}

class FinishedGame extends GameState {
  FinishedGame({
    required String imagePath,
    required Results result,
  }) : super(
          imagePath: imagePath,
          result: result,
        );
}
