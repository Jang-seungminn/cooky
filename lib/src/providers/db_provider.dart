import 'package:cooky/src/models/recipe_rows.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DBProvider extends ChangeNotifier {
  List<RecipeRows> _data = [];
  List<RecipeRows> get data => _data;

  final String dataBox = 'cooky-box';

  // Future<void> getDB() async {
  //   Hive.openBox<RecipeRows>(dataBox).then((value) {
  //     _data = value.values.toList();
  //   });
  // }

  Future<void> createItem(RecipeRows fovorite) async {
    Box box = await Hive.openBox<RecipeRows>(dataBox);
    await box.add(fovorite);
    _data = box.values.toList() as List<RecipeRows>;
  }

  Future<void> resetItems() async {
    Box box = await Hive.openBox<RecipeRows>(dataBox);
    await box.deleteFromDisk();
  }

  Future<void> updateItem(int key, HiveObject param) async {
    Box box = await Hive.openBox<RecipeRows>(dataBox);
    await box.put(key, param);
    _data = box.values.toList() as List<RecipeRows>;
  }

  Future<List> getItem() async {
    Box box = await Hive.openBox<RecipeRows>(dataBox);
    _data = box.values.toList() as List<RecipeRows>;

    return _data;
  }

  Future<void> removeItem(RecipeRows fovorite) async {
    Box box = await Hive.openBox<RecipeRows>(dataBox);
    await box.delete(fovorite.key);
    _data = box.values.toList() as List<RecipeRows>;
  }
}
