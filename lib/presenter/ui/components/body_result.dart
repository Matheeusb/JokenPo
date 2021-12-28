import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokenpo/presenter/enums/results.dart';
import 'package:jokenpo/presenter/ui/bloc/game_bloc.dart';
import 'package:jokenpo/presenter/ui/bloc/game_state.dart';

class BodyResult extends StatelessWidget {
  const BodyResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      if (state is FinishedGame) {
        if (state.result == Results.won) {
          return _greyCard(
              Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
              'Você venceu!');
        }

        if (state.result == Results.drawn) {
          return _greyCard(
              Icon(
                Icons.warning,
                color: Colors.orange,
                size: 50,
              ),
              'Deu empate!');
        }

        if (state.result == Results.lost) {
          return _greyCard(
              Icon(
                Icons.close,
                color: Colors.red,
                size: 50,
              ),
              'Você perdeu!');
        }
      }

      return Container();
    });
  }

  Widget _greyCard(Icon icon, String result) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            result,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
