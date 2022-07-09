import 'package:cooky/src/bloc/recipe_bloc.dart';
import 'package:cooky/src/ui/components/radio_button.dart';
import 'package:cooky/src/ui/widgets/recipe_widget.dart';
import 'package:cooky/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SearchType type;
  TextEditingController textController = TextEditingController();
  late Map<SearchType, String> searchWord;
  bool isPluralOk = false;

  @override
  void initState() {
    super.initState();

    type = SearchType.cookName;
    searchWord = {type: textController.text};
  }

  var startIndex = 1;
  void changeStartIndex(int page) {
    setState(() {
      startIndex = page;
    });
  }

  var endIndex = 1000;
  void changeEndIndex(int page) {
    setState(() {
      endIndex = page;
    });
  }

  Set<String> integrationList = {};

  @override
  Widget build(BuildContext context) {
    List<String> typeList = ['요리 이름으로 찾기', '재료들로 찾기'];
    void _getSearchType(SearchType pType) {
      setState(() {
        type = pType;

        if (type == SearchType.integrationName) {
          isPluralOk = true;
        } else {
          integrationList = {};
          isPluralOk = false;
        }
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
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
            Visibility(
              visible: isPluralOk,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  splashRadius: 25,
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      setState(() {
                        integrationList.add(textController.text);
                        textController.clear();
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: IconButton(
                splashRadius: 25,
                onPressed: () {
                  setState(() {
                    startIndex = 1;
                    endIndex = 1000;
                    searchWord = {type: textController.text};
                  });

                  if (type == SearchType.cookName) {
                    context.read<RecipeBloc>().add(
                          SearchRecipeEvent(
                            startIndex: startIndex,
                            endIndex: endIndex,
                            param: searchWord,
                          ),
                        );
                  } else {
                    context.read<RecipeBloc>().add(
                        SearchRecipeWithIntegrationsEvent(
                            integrationList: integrationList,
                            startIndex: startIndex,
                            endIndex: endIndex));
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        Visibility(
          visible: isPluralOk,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: integrationList.isNotEmpty ? 40 : 0,
              child: ListView.builder(
                itemCount: integrationList.length,
                itemBuilder: (context, index) {
                  if (integrationList.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                integrationList
                                    .remove(integrationList.toList()[index]);
                              });
                            },
                            child: Text(
                              integrationList.toList()[index],
                              style: const TextStyle(fontSize: 20),
                            )),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
        Expanded(
          child: RecipeWidget(
            startIndex: startIndex,
            changeStartIndex: changeStartIndex,
            endIndex: endIndex,
            changeEndIndex: changeEndIndex,
            searchWord: searchWord,
          ),
        ),
      ],
    );
  }
}
