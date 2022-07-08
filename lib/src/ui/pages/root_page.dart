import 'package:cooky/src/providers/navigation_provider.dart';
import 'package:cooky/src/ui/pages/home_page.dart';
import 'package:cooky/src/ui/pages/my_page.dart';
import 'package:cooky/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Cooky'),
          centerTitle: true,
          elevation: 1,
        ),
        body: Consumer<NavigationProvider>(
          builder: (context, provider, child) {
            switch (provider.currentIndex) {
              case 0:
                return const HomePage();

              case 1:
                return const MyPage();

              default:
                return const CircularProgressIndicator();
            }
          },
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
