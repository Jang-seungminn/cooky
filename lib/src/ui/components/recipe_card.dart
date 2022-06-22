import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final int itemCount;
  final Map<String, dynamic> recipeRows;
  const RecipeCard(
      {Key? key, required this.itemCount, required this.recipeRows})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: screenSize.height * 0.8,
        width: screenSize.width * 0.8,
        child: recipeCard(recipeRows, screenSize),
      ),
    );
  }

  Widget recipeCard(Map<String, dynamic> param, Size screenSize) {
    List<Widget> _contents(Map<String, String> contentList) {
      var widgetList = <Widget>[];
      for (var content in contentList.values) {
        if (content == "") {
        } else if (content.contains('http')) {
          widgetList.add(SizedBox(
            width: screenSize.width * 0.7,
            child: Image.network(
              content,
              fit: BoxFit.fill,
            ),
          ));
        } else {
          if (contentList.containsKey('RCP_PARTS_DTLS')) {
            var integrations = content.split('\n');
            for (var i = 0; i < integrations.length; i++) {
              if (i.isEven) {
                widgetList.add(
                  Text(
                    integrations[i],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                widgetList.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(integrations[i]),
                ));
              }
            }
          } else {
            widgetList.add(Text(content));
          }
        }
      }

      return widgetList;
    }

    for (var key in param.keys.toList()) {
      var paramKeyValue = param[key] as Map<String, String>;
      var valueKeyList = paramKeyValue.values.toList();
      if (valueKeyList.every((element) => element == "")) {
        param.remove(key);
      }
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: param.length,
      itemBuilder: ((context, index) {
        return SizedBox(
          height: screenSize.height * 0.75,
          width: screenSize.width * 0.75,
          child: Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _contents(
                  param.values.toList()[index],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
