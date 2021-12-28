import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:jokenpo/presenter/enums/choices.dart';
import 'package:jokenpo/presenter/enums/results.dart';
import 'package:jokenpo/presenter/ui/bloc/game_state.dart';

import 'game_event.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInit()) {
    on<Restart>((event, emit) => emit(GameInit()));
    on<InProgress>((event, emit) => emit(GameInProgress(
          choice: event.choice,
        )));
    on<Play>((event, emit) => emit(_setResult(event.choice)));
  }

  Choices _setChoiceApp() {
    final List<Choices> choices = Choices.values.toList();
    return choices[Random().nextInt(3)];
  }

  FinishedGame _setResult(Choices choice) {
    final Choices choiceApp = _setChoiceApp();
    late Results result;

    if ((choice == Choices.stone && choiceApp == Choices.scissors) ||
        (choice == Choices.scissors && choiceApp == Choices.paper) ||
        (choice == Choices.paper && choiceApp == Choices.stone)) {
      result = Results.won;
    } else if (choice == choiceApp) {
      result = Results.drawn;
    } else {
      result = Results.lost;
    }

    return FinishedGame(
      imagePath: 'assets/images/${choiceApp.toString().replaceAll('Choices.', '')}.png',
      result: result,
    );
  }
}
