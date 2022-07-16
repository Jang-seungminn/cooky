import 'package:cooky/src/models/recipe_rows.dart';
import 'package:cooky/src/providers/db_provider.dart';
import 'package:cooky/src/ui/components/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeButton extends StatelessWidget {
  List<RecipeRows> datas;
  Set<int>? indexList;
  bool isFavorite;
  int index;
  Function(Set<int>)? changeFavoriteList;
  RecipeButton(
      {Key? key,
      required this.datas,
      required this.isFavorite,
      required this.index,
      this.indexList,
      this.changeFavoriteList})
      : super(key: key);
  late DBProvider _dbProvider;
  @override
  Widget build(BuildContext context) {
    _dbProvider = Provider.of<DBProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          splashRadius: 15,
          onPressed: () {
            if (indexList != null) {
              if (indexList!.contains(index)) {
                indexList!.remove(index);
                changeFavoriteList!(indexList!);
                for (var data in datas) {
                  if (data.RCP_NM == datas[index].RCP_NM) {
                    _dbProvider.removeItem(
                      data,
                    );
                  }
                }
              } else {
                indexList!.add(index);
                changeFavoriteList!(indexList!);
                _dbProvider.createItem(
                  datas[index],
                );
              }
            } else {
              for (var data in datas) {
                if (data.RCP_NM == datas[index].RCP_NM) {
                  _dbProvider.removeItem(
                    data,
                  );
                }
              }
            }
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavorite
                ? Theme.of(context).colorScheme.primary
                : Colors.black,
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: () {
              showDialog(
                useSafeArea: true,
                context: context,
                builder: (BuildContext context) {
                  var recipePage = datas[index].toMap();
                  recipePage.removeWhere((key, value) => key == 'HASHTAG');
                  recipePage.removeWhere((key, value) => value == "");

                  return Center(
                    child: RecipeCard(
                      recipeRows: recipePage,
                      itemCount: recipePage.values.toList().length,
                    ),
                  );
                },
              );
            },
            child: Text(
              datas[index].RCP_NM,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
