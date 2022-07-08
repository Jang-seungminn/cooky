import 'package:cooky/src/models/recipe_model.dart';
import 'package:cooky/src/network/network_helper.dart';
import 'package:cooky/src/network/network_service.dart';
import 'package:cooky/src/utils/api_key.dart';

class RecipeRepository {
  final String _baseUrl =
      'http://openapi.foodsafetykorea.go.kr/api/$apiKey/COOKRCP01/json/';

  Future<Recipe> getRecipe(
      {Map<String, String>? qurey,
      required int startPage,
      required int finalPage}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get,
        url: '$_baseUrl$startPage/$finalPage/',
        queryParam: qurey);
    return NetworkHelper.filterResponse(
        callBack: (json) => Recipe.fromJson(json),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An error has happend. $errorType - $msg'));
  }
}
