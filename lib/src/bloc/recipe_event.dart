part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipeEvent extends RecipeEvent {}

class SearchRecipeEvent extends RecipeEvent {
  final Map<SearchType, String> param;
  final int startIndex;
  final int endIndex;

  const SearchRecipeEvent({
    required this.param,
    required this.startIndex,
    required this.endIndex,
  });
}

class SearchRecipeWithIntegrationsEvent extends RecipeEvent {
  final Set<String> integrationList;
  final int startIndex;
  final int endIndex;

  const SearchRecipeWithIntegrationsEvent({
    required this.integrationList,
    required this.startIndex,
    required this.endIndex,
  });
}
