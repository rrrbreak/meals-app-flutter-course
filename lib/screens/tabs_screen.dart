// A screen which will only manage the tabs and then load different screens depending on which tab was selected.

//So the TabsScreen has the goal of rendering the tabs and then the appropriate content for each tab depending on which tab was selected.

// Now the default tab controller and the TabBar here are automatically connected by Flutter behind the scenes. So the default tab controller will automatically detect which tab you selected and then show the right content for that tab, you just need you tell it which content to show for which tab and therefore to your scaffold so after the appBar, you add your body but now instead of adding a normal body, like a column or a text, you add a TabBarView.

// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key key}) : super(key: key);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex:
//           0, // która pierwsza strona będzie wybrana - defaultowo to jest 0, czyli pierwsza strona
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         // The TabBarView is taken into account by the default tab controller in conjunction with your TabBar and Flutter then keeps track which tab you selected and if it's the first tab, then the first element which you add here to TabBarView will be shown and if it's the second tab, the second element will be shown because to TabBarView, you add children and now you should add as many child widgets here as you have tabs because then the child widget for each tab will be shown as the main body of this screen and therefore here, we could now add categories - the categories screen and later also add the favoritesScreen which we yet have to add.
//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavouritesScreen(),
//         ]),
//       ),
//     );
//   }
// }

// BottomNavigationBar
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //you need to control what's displayed and for that, you should manage your own list of widgets
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    // here that's why we need a stateful widget because we will manually switch that index and we want to update what's shown on the screen whenever that happens because we want to switch the widget that is dispalyed
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,

        //This tells the bottom navigation bar which tab is actually selected.
        currentIndex: _selectedPageIndex,
        // ładne przejście
        // type: BottomNavigationBarType.shifting,
        items: [
          // it is just tab but is weird named
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
