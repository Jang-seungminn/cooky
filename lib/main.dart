import 'package:cooky/src/bloc/recipe_bloc.dart';
import 'package:cooky/src/models/favorite_model.dart';
import 'package:cooky/src/providers/db_provider.dart';
import 'package:cooky/src/providers/navigation_provider.dart';
import 'package:cooky/src/repositories/recipe_repository.dart';
import 'package:cooky/src/ui/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter('cooky');
  Hive.registerAdapter(FavoriteModelAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DBProvider(),
        ),
        RepositoryProvider(
          create: (_) => RecipeRepository(),
        ),
        BlocProvider<RecipeBloc>(
          create: (context) => RecipeBloc(
            RepositoryProvider.of<RecipeRepository>(context),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  late DBProvider dbProvider;

  @override
  Widget build(BuildContext context) {
    dbProvider = Provider.of<DBProvider>(context);
    dbProvider.getItem();
    return MaterialApp(
      title: 'Cooky',
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}
