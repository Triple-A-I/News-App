import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../design/widgets/article_builder.dart';

import '../../logic/bloc/news_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is NewsGetBusinessErrorStates) {}
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return articleBuilder(state, NewsGetBusinessLoadingStates(), list);
      },
    );
  }
}
