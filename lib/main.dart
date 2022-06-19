import 'package:cooky/src/bloc/recipe_bloc.dart';
import 'package:cooky/src/providers/navigation_provider.dart';
import 'package:cooky/src/repositories/recipe_repository.dart';
import 'package:cooky/src/ui/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
