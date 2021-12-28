import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokenpo/presenter/theme/theme_cubit.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('JokenPo'),
      backgroundColor: Colors.green,
      actions: [
        IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: Icon(Icons.brightness_4_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
