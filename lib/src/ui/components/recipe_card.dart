import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecipeCard extends StatefulWidget {
  final int itemCount;
  final Map<String, dynamic> recipeRows;
  const RecipeCard(
      {Key? key, required this.itemCount, required this.recipeRows})
      : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: screenSize.height * 0.8,
            width: screenSize.width,
            child: recipeCard(widget.recipeRows, screenSize),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: widget.recipeRows.length,
          effect: WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              activeDotColor: Theme.of(context).colorScheme.primary
              // strokeWidth: 5,
              ),
        ),
      ],
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.network(
                content,
                fit: BoxFit.fill,
              ),
            ),
          ));
        } else {
          if (contentList.containsKey('RCP_PARTS_DTLS')) {
            widgetList.add(
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: Column(
                  children: [
                    const Text(
                      '재료',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      content.replaceAll('\n', '\n\n'),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (contentList.containsKey('RCP_NM')) {
            widgetList.add(
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else if (contentList.keys.toList().first.startsWith('INFO')) {
            if (content.contains('열량')) {
              content += ' kcal';
            } else if (content.contains('나트륨')) {
              content += ' mg';
            } else {
              content += ' g';
            }
            widgetList.add(
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            );
          } else {
            widgetList.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  content.replaceAll('\n', ''),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            );
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

    return PageView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: param.length,
      itemBuilder: ((context, index) {
        return Card(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
