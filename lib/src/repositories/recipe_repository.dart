import 'package:cooky/src/models/recipe_model.dart';
import 'package:cooky/src/network/network_helper.dart';
import 'package:cooky/src/network/network_service.dart';

class RecipeRepository {
  final String _baseUrl =
      'http://openapi.foodsafetykorea.go.kr/api/7cc01f89be7f4324a803/COOKRCP01/json/1/10/';

  Future<Recipe> getRecipe({Map<String, String>? qurey}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl, queryParam: qurey);
    return NetworkHelper.filterResponse(
        callBack: (json) => Recipe.fromJson(json),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An error has happend. $errorType - $msg'));
  }
}
