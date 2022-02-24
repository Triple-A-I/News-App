import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../design/widgets/article_builder.dart';
import '../../logic/bloc/news_bloc.dart';

class EntertainmnetScreen extends StatelessWidget {
  const EntertainmnetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is NewsGetEntertainmentErrorStates) {}
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).entertainment;
        return articleBuilder(state, NewsGetEntertainmentLoadingStates(), list);
      },
    );
  }
}
