part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeLodaingState extends RecipeState {}

class RecipeErrorState extends RecipeState {
  final String message;

  const RecipeErrorState(this.message);
}

class RecipeLoadedState extends RecipeState {
  final Recipe recipe;
  final List<RecipeRows> rows;

  const RecipeLoadedState(this.recipe, this.rows);
}

class RecipeSearchedState extends RecipeState {
  final Recipe recipe;
  final List<RecipeRows> rows;

  const RecipeSearchedState(this.recipe, this.rows);
}
