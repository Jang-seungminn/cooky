import 'package:cooky/src/bloc/recipe_bloc.dart';
import 'package:cooky/src/repositories/recipe_repository.dart';
import 'package:cooky/src/ui/components/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeErrorState) {
              return Text(
                state.message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              );
            }
            if (state is RecipeLoadedState) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(state.recipe.COOKRCP01['total_count']),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemBuilder: (context, index) => TextButton(
                          onPressed: () {
                            showDialog(
                              useSafeArea: true,
                              context: context,
                              builder: (BuildContext context) {
                                var recipePage = state.rows[index].toMap();
                                recipePage
                                    .removeWhere((key, value) => value == "");

                                return Center(
                                  child: RecipeCard(
                                    recipeRows: recipePage,
                                    itemCount:
                                        recipePage.values.toList().length,
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            state.rows[index].RCP_NM,
                          ),
                        ),
                        itemCount: state.recipe.COOKRCP01['row'].length,
                      ),
                    ),
                    TextButton(
                      child: Text('${state.recipe}'),
                      onPressed: () =>
                          context.read<RecipeBloc>().add(LoadRecipeEvent()),
                    ),
                  ],
                ),
              );
            }
            if (state is RecipeSearchedState) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(state.recipe.COOKRCP01['total_count']),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemBuilder: (context, index) => TextButton(
                          onPressed: () {
                            showDialog(
                              useSafeArea: true,
                              context: context,
                              builder: (BuildContext context) {
                                var recipePage = state.rows[index].toMap();
                                recipePage
                                    .removeWhere((key, value) => value == "");

                                return Center(
                                  child: RecipeCard(
                                    recipeRows: recipePage,
                                    itemCount:
                                        recipePage.values.toList().length,
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            state.rows[index].RCP_NM,
                          ),
                        ),
                        itemCount: state.recipe.COOKRCP01['row'].length,
                      ),
                    ),
                    TextButton(
                      child: Text('${state.recipe}'),
                      onPressed: () =>
                          context.read<RecipeBloc>().add(LoadRecipeEvent()),
                    ),
                  ],
                ),
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
