
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/text_cubit.dart';
import '../widgets/text_switcher_widget.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Simple Text Switcher'),
			),
			body: Center(
				child: BlocBuilder<TextCubit, TextModel>(
					builder: (context, state) {
						return TextSwitcherWidget(
							text: state.text,
							icon: state.icon,
							onTap: () => context.read<TextCubit>().toggleText(),
						);
					},
				),
			),
		);
	}
}
