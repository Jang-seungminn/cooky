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
          final recipe = await _repository.getRecipe(
            startPage: 1,
            finalPage: 10,
          );
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
      emit(RecipeSearchingState());
      if (event.param.values.first == '') {
        emit(const RecipeErrorState('검색된 결과가 없습니다.'));
      } else {
        try {
          final Map<String, String> qureyParam = {
            event.param.keys.first == SearchType.cookName
                ? 'RCP_NM'
                : 'RCP_PARTS_DTLS': event.param.values.first
          };
          final recipe = await _repository.getRecipe(
              startPage: event.startIndex,
              finalPage: event.endIndex,
              qurey: qureyParam);
          var rows = recipe.COOKRCP01['row'];
          List<RecipeRows> rowList = [];
          for (var r in rows) {
            rowList.add(RecipeRows.fromJson(r));
          }
          emit(RecipeSearchedState(recipe, rowList));
        } catch (e) {
          emit(RecipeErrorState(e.toString()));
        }
      }
    });

    on<SearchRecipeWithIntegrationsEvent>((event, emit) async {
      emit(RecipeSearchingState());
      List<RecipeRows> rowList = [];
      Map<String, int> pluralMap = {};
      late Recipe recipe;
      if (event.integrationList.isEmpty) {
        emit(const RecipeErrorState('검색된 결과가 없습니다.'));
      } else {
        try {
          for (var integration in event.integrationList) {
            Map<String, String> qureyParam = {'RCP_PARTS_DTLS': integration};

            recipe = await _repository.getRecipe(
                startPage: event.startIndex,
                finalPage: event.endIndex,
                qurey: qureyParam);
            var rows = recipe.COOKRCP01['row'];
            for (var r in rows) {
              pluralMap[RecipeRows.fromJson(r).RCP_NM] =
                  pluralMap[RecipeRows.fromJson(r).RCP_NM] == null
                      ? 1
                      : pluralMap[RecipeRows.fromJson(r).RCP_NM]! + 1;
              if (pluralMap[RecipeRows.fromJson(r).RCP_NM] ==
                  event.integrationList.length) {
                rowList.add(RecipeRows.fromJson(r));
              }
            }
          }

          if (rowList.isEmpty) {
            emit(const RecipeErrorState('검색된 결과가 없습니다.'));
          } else {
            emit(RecipeSearchedState(recipe, rowList));
          }
        } catch (e) {
          emit(RecipeErrorState(e.toString()));
        }
      }
    });
  }
}
