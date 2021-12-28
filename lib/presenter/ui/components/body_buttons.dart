import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokenpo/presenter/ui/bloc/game_bloc.dart';
import 'package:jokenpo/presenter/ui/bloc/game_event.dart';
import 'package:jokenpo/presenter/ui/bloc/game_state.dart';

class BodyButtons extends StatelessWidget {
  const BodyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GameBloc, GameState>(builder: (context, state) {
          return ElevatedButton(
            onPressed: state is GameInProgress
                ? () => context.read<GameBloc>().add(Play(state.choice!))
                : null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Play'),
                Icon(Icons.play_arrow),
              ],
            ),
          );
        }),
        ElevatedButton(
          onPressed: () => context.read<GameBloc>().add(Restart()),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Restart'),
              Icon(Icons.refresh),
            ],
          ),
        ),
      ],
    );
  }
}
