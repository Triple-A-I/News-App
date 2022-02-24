// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/design/widgets/article_builder.dart';
// import 'package:news_app/design/widgets/default_from_field.dart';
// import 'package:news_app/logic/bloc/news_bloc.dart';

// // ignore: must_be_immutable, use_key_in_widget_constructors
// class SearchScreen extends StatelessWidget {
//   var searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit, NewsStates>(
//       builder: (context, state) {
//         var list = NewsCubit.get(context).search;
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: defaultFormField(
//                   validate: (value) {
//                     if (value.isEmpty) {
//                       return "Tasks title mustn't be Empty";
//                     } else {
//                       return null;
//                     }
//                   },
//                   label: 'Search',
//                   icon: Icons.search,
//                   controller: searchController,
//                   type: TextInputType.text,
//                   onChanged: (String value) {
//                     print('+++++++++++++++++++++ $value');
//                     NewsCubit.get(context).getSearch(value);
//                   },
//                 ),
//               ),
//               Expanded(
//                   child: articleBuilder(
//                       state, NewsGetSearchLoadingStates(), list)),
//             ],
//           ),
//         );
//       },
//       listener: (context, state) {},
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/bloc/news_bloc.dart';

import '../../design/widgets/article_builder.dart';
import '../../design/widgets/default_from_field.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  icon: Icons.search,
                  controller: searchController,
                  type: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  label: 'Search',
                ),
              ),
              Expanded(
                  child: articleBuilder(
                      state, NewsGetSearchLoadingStates(), list)),
            ],
          ),
        );
      },
    );
  }
}
