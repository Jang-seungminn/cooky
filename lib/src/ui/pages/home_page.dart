import 'package:cooky/src/bloc/recipe_bloc.dart';
import 'package:cooky/src/ui/components/radio_button.dart';
import 'package:cooky/src/ui/widgets/recipe_widget.dart';
import 'package:cooky/src/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SearchType type;
  @override
  void initState() {
    super.initState();
    type = SearchType.cookName;
  }

  @override
  Widget build(BuildContext context) {
    List<String> typeList = ['요리 이름으로 찾기', '재료들로 찾기'];
    TextEditingController textController = TextEditingController();
    void _getSearchType(SearchType pType) {
      setState(() {
        type = pType;
      });
    }

    return Column(
      children: [
        RadioButton(
          typeList: typeList,
          notifyParent: _getSearchType,
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: type == SearchType.cookName
                        ? '요리 이름을 검색하세요.'
                        : '재료를 입력하세요.',
                  ),
                  controller: textController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                splashRadius: 25,
                onPressed: () {
                  context.read<RecipeBloc>().add(SearchRecipeEvent(
                        startPage: 1,
                        finalPage: 50,
                        param: {type: textController.value.text},
                      ));
                  if (textController.value.text != '') {
                    if (kDebugMode) {
                      print(textController.value.text);
                    }
                  }
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        const RecipeWidget(),
      ],
    );
  }
}
