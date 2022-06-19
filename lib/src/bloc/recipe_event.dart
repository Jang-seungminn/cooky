part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipeEvent extends RecipeEvent {}

class SearchRecipeEvent extends RecipeEvent {
  final Map<SearchType, String> param;

  const SearchRecipeEvent({required this.param});
}
