import 'package:cooky/src/providers/navigation_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.changeCurrentIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'MY',
            ),
          ],
        );
      },
    );
  }
}
