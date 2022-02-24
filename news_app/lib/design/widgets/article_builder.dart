// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import '../../logic/bloc/news_bloc.dart';

import 'article_item.dart';
import 'my_divider.dart';

Widget articleBuilder(NewsStates state, NewsStates loading, list) {
  print("ALBRAAAAAAAAAAAAAAA:  $loading");
  return state == loading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        );
}
