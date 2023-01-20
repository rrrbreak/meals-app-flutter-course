import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

//initState would have been great if we wouldn't have required to use modal route of context in here, so any of context stuff which you need to do in here will unfortunately not work but in
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

//this will be triggered essentially whenever the references of the state change, which also means it will be called when the widget that belongs to the state has been fully initialized and we can tap into context, this will still run before build runs.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // if it's true in this case
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    // you can extract your route arguments and store them in a variable, maybe routeArgs, by using modal another class provided by Flutter material which you also connect to your context with of context and then there, you can get information about the route that was loaded to display this widget You have a settings object there and there, you have an arguments object or your arguments key and that gives you the arguments as you pass them here when you pushed that named route (in category item Navigator.of(context).pushNamed(route_name))

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
