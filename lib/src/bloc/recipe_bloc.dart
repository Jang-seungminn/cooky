import 'package:bloc/bloc.dart';
import 'package:cooky/src/models/recipe_model.dart';
import 'package:cooky/src/repositories/recipe_repository.dart';
import 'package:cooky/src/utils/const.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository _repository;

  RecipeBloc(this._repository) : super(RecipeLodaingState()) {
    on<LoadRecipeEvent>(
      (event, emit) async {
        emit(RecipeLodaingState());
        try {
          final recipe = await _repository.getRecipe();
          var rows = recipe.COOKRCP01['row'];
          List<RecipeRows> rowList = [];
          for (var r in rows) {
            rowList.add(RecipeRows.fromJson(r));
          }
          emit(RecipeLoadedState(recipe, rowList));
        } catch (e) {
          emit(RecipeErrorState(e.toString()));
        }
      },
    );
    on<SearchRecipeEvent>((event, emit) async {
      emit(RecipeLodaingState());
      try {
        final Map<String, String> qureyParam = {
          event.param.keys.first == SearchType.cookName
              ? 'RCP_NM'
              : 'RCP_PARTS_DTLS': event.param.values.first
        };
        final recipe = await _repository.getRecipe(qurey: qureyParam);
        var rows = recipe.COOKRCP01['row'];
        List<RecipeRows> rowList = [];
        for (var r in rows) {
          rowList.add(RecipeRows.fromJson(r));
        }
        emit(RecipeSearchedState(recipe, rowList));
      } catch (e) {
        emit(RecipeErrorState(e.toString()));
      }
    });
  }
}
