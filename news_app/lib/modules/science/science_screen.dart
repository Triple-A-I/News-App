import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/design/widgets/article_builder.dart';
import '../../logic/bloc/news_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is NewsGetScienceErrorStates) {}
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return articleBuilder(state, NewsGetScienceLoadingStates(), list);
      },
    );
  }
}
