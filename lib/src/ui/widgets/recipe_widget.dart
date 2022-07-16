import 'package:cooky/src/bloc/recipe_bloc.dart';
import 'package:cooky/src/models/recipe_rows.dart';
import 'package:cooky/src/providers/db_provider.dart';
import 'package:cooky/src/ui/components/recipe_button_widget.dart';
import 'package:cooky/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RecipeWidget extends StatefulWidget {
  RecipeWidget({
    Key? key,
    required this.searchWord,
    required this.startIndex,
    required this.endIndex,
    required this.changeStartIndex,
    required this.changeEndIndex,
  }) : super(key: key);
  int startIndex;
  Function(int) changeStartIndex;
  int endIndex;
  Function(int) changeEndIndex;
  Map<SearchType, String> searchWord;
  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  ScrollController scrollController = ScrollController();
  late DBProvider dbProvider;

  late int totalConut;
  Set<int> favoriteIndexList = {};

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void changeFavoriteList(Set<int> favorite) {
    setState(() {
      favoriteIndexList = favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    dbProvider = Provider.of<DBProvider>(context, listen: false);
    List<RecipeRows> favoriteList = dbProvider.data;

    void changeIndex(String ch) {
      bool isChange = false;
      int start = widget.startIndex;
      int end = widget.endIndex;

      if (ch == '+') {
        if (end < totalConut) {
          start += 1000;
          end += 1000;
          isChange = true;
        }
      } else {
        if (start > 1) {
          start -= 1000;
          end -= 1000;
          isChange = true;
        }
      }

      widget.changeStartIndex(start);
      widget.changeEndIndex(end);
      if (isChange) {
        context.read<RecipeBloc>().add(
              SearchRecipeEvent(
                param: widget.searchWord,
                startIndex: start,
                endIndex: end,
              ),
            );
      }
    }

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.minScrollExtent ==
            scrollController.position.pixels) {
          changeIndex('-');
        } else if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          changeIndex('+');
        }
      }
    });

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeSearchingState) {
              return const CircularProgressIndicator();
            }

            if (state is RecipeErrorState) {
              return Text(
                state.message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              );
            }

            if (state is RecipeSearchedState) {
              favoriteIndexList = {};
              bool isFavorite = false;

              totalConut =
                  int.parse(state.recipe.COOKRCP01['total_count']) > 1000
                      ? int.parse(state.recipe.COOKRCP01['total_count'])
                      : state.rows.length;

              return Column(
                children: [
                  // Text('레시피 ${totalConut.toString()}'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.rows.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        for (var data in favoriteList) {
                          if (data.RCP_NM == state.rows[index].RCP_NM) {
                            favoriteIndexList.add(index);
                          }
                        }
                        if (favoriteIndexList.contains(index)) {
                          isFavorite = true;
                        } else {
                          isFavorite = false;
                        }
                        return RecipeButton(
                          datas: state.rows,
                          isFavorite: isFavorite,
                          index: index,
                          indexList: favoriteIndexList,
                          changeFavoriteList: changeFavoriteList,
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
