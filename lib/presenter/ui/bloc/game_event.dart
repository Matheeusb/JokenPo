import 'package:jokenpo/presenter/enums/choices.dart';

abstract class GameEvent {}

class Play extends GameEvent {
  final Choices choice;

  Play(this.choice);
}

class Restart extends GameEvent {}

class InProgress extends GameEvent {
  final Choices choice;

  InProgress(this.choice);
}
