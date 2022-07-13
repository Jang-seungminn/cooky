import 'package:cooky/src/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DBProvider extends ChangeNotifier {
  List<FavoriteModel> _data = [];
  List<FavoriteModel> get data => _data;

  final String dataBox = 'cooky-box';

  // Future<void> getDB() async {
  //   Hive.openBox<FavoriteModel>(dataBox).then((value) {
  //     _data = value.values.toList();
  //   });
  // }

  Future<void> createItem(FavoriteModel fovorite) async {
    Box box = await Hive.openBox<FavoriteModel>(dataBox);
    await box.add(fovorite);
    _data = box.values.toList() as List<FavoriteModel>;
  }

  Future<void> resetItems() async {
    Box box = await Hive.openBox<FavoriteModel>(dataBox);
    await box.deleteFromDisk();
  }

  Future<void> updateItem(int key, HiveObject param) async {
    Box box = await Hive.openBox<FavoriteModel>(dataBox);
    await box.put(key, param);
    _data = box.values.toList() as List<FavoriteModel>;
  }

  Future<List> getItem() async {
    Box box = await Hive.openBox<FavoriteModel>(dataBox);
    _data = box.values.toList() as List<FavoriteModel>;

    return _data;
  }

  Future<void> removeItem(FavoriteModel fovorite) async {
    Box box = await Hive.openBox<FavoriteModel>(dataBox);
    await box.delete(fovorite.key);
    _data = box.values.toList() as List<FavoriteModel>;
  }
}
