import 'package:cooky/src/models/recipe_rows.dart';
import 'package:cooky/src/providers/db_provider.dart';
import 'package:cooky/src/ui/components/recipe_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  late DBProvider _dbProvider;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    _dbProvider = Provider.of<DBProvider>(context);

    List<RecipeRows> favoriteList = _dbProvider.data;
    ScrollController scrollController = ScrollController();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _dbProvider.data.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              if (favoriteList.contains(_dbProvider.data[index])) {
                isFavorite = true;
              } else {
                isFavorite = false;
              }
              return RecipeButton(
                datas: _dbProvider.data,
                index: index,
                isFavorite: isFavorite,
              );
            },
          ),
        ),
      ],
    );
  }
}
