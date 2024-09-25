
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_text_switcher/cubit/text_cubit.dart';

class TextSwitcherWidget extends StatelessWidget {
	const TextSwitcherWidget({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<TextCubit, TextState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () => context.read<TextCubit>().toggleText(),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.text),
							Icon(state.icon),
						],
					),
				);
			},
		);
	}
}
