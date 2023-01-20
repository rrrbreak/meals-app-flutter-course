import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w600),
            headline5: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Releway',
                fontWeight: FontWeight.w300)),
      ),
      // home: CategoriesScreen(), // here we set our starting app screen
      initialRoute: '/', // default is '/'

      // routes takes a map and therefore, you need curly braces to create that map, where you have string keys which identify a route and a route is really just a screen and then the value after the : is in the end your creation function for that screen. On the right side, you have your builder method where you get some context created automatically by Flutter
      // routes : {'/idenifier' : (context) => page()}
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName:(context) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(
        //   builder: (context) => CategoriesScreen(),
        // );
      },

      //Here I will provide it with categories screen as a default.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
