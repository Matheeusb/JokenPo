import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokenpo/presenter/enums/choices.dart';
import 'package:jokenpo/presenter/ui/bloc/game_bloc.dart';
import 'package:jokenpo/presenter/ui/bloc/game_state.dart';

import '../bloc/game_event.dart';

class BodyOptions extends StatefulWidget {
  const BodyOptions({Key? key}) : super(key: key);

  @override
  _BodyOptionsState createState() => _BodyOptionsState();
}

class _BodyOptionsState extends State<BodyOptions> {
  late List<bool> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      if (state is GameInit) {
        items = [false, false, false];
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Text(
              'Escolha do app:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Image(
            image: AssetImage(state.imagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Text(
              'Sua escolha:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildChoice(
                choice: Choices.stone,
                enable: state is FinishedGame,
                selected: items[0],
                item: 0,
              ),
              _buildChoice(
                choice: Choices.paper,
                enable: state is FinishedGame,
                selected: items[1],
                item: 1,
              ),
              _buildChoice(
                choice: Choices.scissors,
                enable: state is FinishedGame,
                selected: items[2],
                item: 2,
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildChoice({
    required Choices choice,
    required bool enable,
    required bool selected,
    required int item,
  }) {
    return GestureDetector(
      onTap: enable
          ? null
          : () {
              context.read<GameBloc>().add(InProgress(choice));
              _selectItem(item);
            },
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.green : null,
        ),
        child: Image.asset(
          'assets/images/${choice.toString().replaceAll('Choices.', '')}.png',
          height: 100,
        ),
      ),
    );
  }

  _selectItem(int item) {
    setState(() {
      items = [false, false, false];
      items[item] = true;
    });
  }
}
